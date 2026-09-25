import os
import re
import subprocess
import tkinter as tk
from pathlib import Path
from typing import Any

import yaml
from dotenv import load_dotenv
from textual import events, on
from textual.app import App, ComposeResult
from textual.containers import Container, Horizontal, Vertical
from textual.screen import ModalScreen
from tkinter import filedialog
from textual.widgets import Button, Footer, Header, Input, Label, ListItem, ListView, Static


load_dotenv()

ROOT_DIR = Path(__file__).resolve().parent
# Repo root (Tools/Jukebox-Manager -> ../../), so relative overrides resolve
# against the content tree no matter where the tool is launched from.
CONTENT_ROOT = (ROOT_DIR / "../../").resolve()

RESOURCE_VARIANT = os.getenv("RESOURCE_VARIANT", "").strip()
RESOURCE_VARIANT_SEGMENT = f"{RESOURCE_VARIANT}/" if RESOURCE_VARIANT else ""


def resolve_content_path(value: str | None, default: Path) -> Path:
    """Resolve a .env override (repo-root-relative or absolute) or use the default."""
    cleaned = (value or "").strip().strip('"').strip("'")
    if not cleaned:
        return default
    candidate = Path(cleaned)
    if not candidate.is_absolute():
        candidate = CONTENT_ROOT / candidate
    return candidate.resolve()


def default_audio_dir() -> Path:
    override = os.getenv("JUKEBOX_AUDIO_DIR", "")
    fallback = (CONTENT_ROOT / f"Resources/Audio/{RESOURCE_VARIANT_SEGMENT}Jukebox").resolve()
    return resolve_content_path(override, fallback)


def infer_catalog_for_audio(audio_dir: Path) -> Path:
    """Mirror Resources/Audio/<variant...>/<leaf> to
    Resources/Prototypes/<variant...>/Catalog/<leaf>/Standard.yml.

    Examples:
      Audio/Jukebox                  -> Prototypes/Catalog/Jukebox/Standard.yml
      Audio/_MegaHetero/Jukebox      -> Prototypes/_MegaHetero/Catalog/Jukebox/Standard.yml
      Audio/_MegaHetero/Party        -> Prototypes/_MegaHetero/Catalog/Party/Standard.yml
    """
    try:
        rel = audio_dir.resolve().relative_to((CONTENT_ROOT / "Resources/Audio").resolve())
    except ValueError:
        rel = None
    if rel is not None and len(rel.parts) >= 1:
        variant_parts = rel.parts[:-1]
        leaf = rel.parts[-1]
        catalog_rel = Path("Resources/Prototypes", *variant_parts, "Catalog", leaf, "Standard.yml")
        return (CONTENT_ROOT / catalog_rel).resolve()
    return (CONTENT_ROOT / "Resources/Prototypes/Catalog/Jukebox/Standard.yml").resolve()


def default_catalog_path(audio_dir: Path | None = None) -> Path:
    override = os.getenv("JUKEBOX_CATALOG_FILE", "")
    fallback = infer_catalog_for_audio(audio_dir or default_audio_dir())
    return resolve_content_path(override, fallback)


def discover_catalogs() -> list[Path]:
    """Find every jukebox catalog file so the list aggregates public, variant
    (e.g. _MegaHetero, _Starfall) and custom-dir catalogs.

    Looks for Standard.yml under any Catalog/<leaf>/ dir at the Prototypes
    root or one level below it (variant dirs), plus the configured default.
    """
    found: dict[Path, None] = {}
    protos_root = (CONTENT_ROOT / "Resources/Prototypes").resolve()
    patterns: list[Path] = []
    if protos_root.is_dir():
        patterns.extend(sorted(protos_root.glob("Catalog/*/Standard.yml")))
        for child in sorted(protos_root.iterdir()):
            if child.is_dir() and not child.name.startswith("."):
                patterns.extend(sorted(child.glob("Catalog/*/Standard.yml")))
    for candidate in patterns + [CATALOG_PATH]:
        resolved = candidate.resolve()
        if resolved.is_file() and resolved not in found:
            found[resolved] = None
    # Always include the configured default (even if missing) so Add has a target.
    default = CATALOG_PATH.resolve()
    if default not in found:
        found[default] = None
    return list(found.keys())


def catalog_variant_tag(catalog_path: Path) -> str:
    """Short source label for a catalog file, e.g. 'public' or '_MegaHetero'."""
    try:
        rel = catalog_path.resolve().relative_to(
            (CONTENT_ROOT / "Resources/Prototypes").resolve()
        )
    except ValueError:
        return catalog_path.stem
    parts = rel.parts
    if "Catalog" in parts:
        variant = parts[: parts.index("Catalog")]
        return "/".join(variant) if variant else "public"
    return catalog_path.stem


def audio_dir_for_catalog(catalog_path: Path) -> Path:
    """Reverse of infer_catalog_for_audio: map a catalog file back to its audio dir.

    Resources/Prototypes/<variant...>/Catalog/<leaf>/Standard.yml ->
    Resources/Audio/<variant...>/<leaf>. Falls back to AUDIO_DIR when the
    layout does not match.
    """
    try:
        rel = catalog_path.resolve().relative_to(
            (CONTENT_ROOT / "Resources/Prototypes").resolve()
        )
    except ValueError:
        return AUDIO_DIR
    parts = rel.parts
    if "Catalog" in parts:
        idx = parts.index("Catalog")
        variant_parts = parts[:idx]
        leaf_parts = parts[idx + 1 : -1] or ("Jukebox",)
        return (CONTENT_ROOT / Path("Resources/Audio", *variant_parts, *leaf_parts)).resolve()
    return AUDIO_DIR


def normalize_variant(value: str | None) -> str:
    """Normalize a variant name typed in the Add dialog.

    Empty or 'public' means the public (unprefixed) tree; anything else is
    used verbatim, e.g. '_MegaHetero'.
    """
    cleaned = (value or "").strip().strip('"').strip("'")
    if not cleaned or cleaned.lower() == "public":
        return ""
    return cleaned


def resolve_add_target(variant_or_dest: str | None) -> tuple[Path, Path]:
    """Resolve the Add dialog's variant field to an (audio_dir, catalog_path) pair.

    Accepts either a plain variant name (e.g. '_MegaHetero', empty = default)
    or, for back-compat, a full destination dir
    (e.g. 'Resources/Audio/_MegaHetero/Jukebox'), which maps to its mirrored
    catalog file, keeping prototype /Audio/... paths in sync.
    """
    cleaned = (variant_or_dest or "").strip().strip('"').strip("'")
    if not cleaned:
        audio_dir = default_audio_dir()
        return audio_dir, default_catalog_path(audio_dir)
    if "/" in cleaned or "\\" in cleaned:
        return resolve_destination(cleaned)
    variant = normalize_variant(cleaned)
    segment = f"{variant}/" if variant else ""
    audio_dir = (CONTENT_ROOT / f"Resources/Audio/{segment}Jukebox").resolve()
    return audio_dir, infer_catalog_for_audio(audio_dir)


def resolve_destination(dest_input: str | None) -> tuple[Path, Path]:
    """Resolve the per-add destination dir to an (audio_dir, catalog_path) pair.

    Empty input means "use the configured defaults" (.env overrides or variant).
    A custom dir (e.g. Resources/Audio/_MegaHetero/Jukebox) automatically maps
    to its mirrored catalog file, keeping prototype /Audio/... paths in sync.
    """
    cleaned = (dest_input or "").strip().strip('"').strip("'")
    if not cleaned:
        audio_dir = default_audio_dir()
        return audio_dir, default_catalog_path(audio_dir)
    audio_dir = resolve_content_path(cleaned, default_audio_dir())
    return audio_dir, infer_catalog_for_audio(audio_dir)


def display_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(CONTENT_ROOT).as_posix()
    except ValueError:
        return str(path)


def resource_audio_prefix(audio_dir: Path) -> str:
    """Map a filesystem audio dir back to its /Audio/... resource prefix."""
    try:
        rel = audio_dir.resolve().relative_to((CONTENT_ROOT / "Resources").resolve())
    except ValueError:
        return "/Audio/Jukebox"
    return "/" + rel.as_posix()


def attributions_for(audio_dir: Path) -> Path:
    return audio_dir / "attributions.yml"


AUDIO_DIR = default_audio_dir()
CATALOG_PATH = default_catalog_path(AUDIO_DIR)
SUPPORTED_AUDIO_EXTENSIONS = {
    ".ogg",
    ".mp3",
    ".wav",
    ".flac",
    ".aac",
    ".m4a",
    ".wma",
    ".opus",
}


def load_yaml(file_path: Path) -> list[dict[str, Any]]:
    if file_path.exists():
        with file_path.open("r", encoding="utf-8") as file:
            return yaml.safe_load(file) or []
    return []


def save_yaml(file_path: Path, data: list[dict[str, Any]]) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        yaml.safe_dump(data, file, sort_keys=False, allow_unicode=True)


def update_attributions(file_name: str, audio_dir: Path | None = None) -> None:
    target_audio = audio_dir or AUDIO_DIR
    attributions_path = attributions_for(target_audio)
    attributions_data = load_yaml(attributions_path)
    for entry in attributions_data:
        files = entry.get("files", []) if isinstance(entry, dict) else []
        if isinstance(files, list) and file_name in files:
            return  # already attributed; don't stack duplicates on re-add

    default_attribution = {
        "files": [file_name],
        "license": "CC-BY-SA-3.0",
        "copyright": f"{file_name} by Unknown Artist. Exported in Mono OGG.",
        "source": "Unknown",
    }

    attributions_data.append(default_attribution)
    save_yaml(attributions_path, attributions_data)


def convert_audio_to_ogg(source_file: Path, dest_path: Path) -> None:
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [
            "ffmpeg",
            "-y",
            "-i",
            str(source_file),
            "-ac",
            "1",
            str(dest_path),
        ],
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.PIPE,
        text=True,
    )


def import_audio_to_resources(
    source_file: Path,
    audio_dir: Path | None = None,
    catalog_path: Path | None = None,
) -> dict[str, str]:
    target_audio = audio_dir or AUDIO_DIR
    target_catalog = catalog_path or default_catalog_path(target_audio)
    file_name = f"{source_file.stem}.ogg"
    target_audio.mkdir(parents=True, exist_ok=True)
    dest_path = target_audio / file_name
    convert_audio_to_ogg(source_file, dest_path)

    item_id = source_file.stem.replace(" ", "_")
    item_name = source_file.stem.replace("_", " ")
    resource_prefix = resource_audio_prefix(target_audio)
    new_item = {
        "type": "jukebox",
        "id": item_id,
        "name": item_name,
        "path": {"path": f"{resource_prefix}/{file_name}"},
    }

    yaml_data = load_yaml(target_catalog)
    replaced = any(isinstance(e, dict) and e.get("id") == item_id for e in yaml_data)
    # Replace same-ID entries instead of stacking duplicates: duplicate
    # prototype IDs crash the server at startup (PrototypeLoadException).
    yaml_data = [e for e in yaml_data if not (isinstance(e, dict) and e.get("id") == item_id)]
    yaml_data.append(new_item)
    save_yaml(target_catalog, yaml_data)
    update_attributions(file_name, target_audio)
    return {"id": item_id, "file": file_name, "catalog": str(target_catalog),
            "replaced": str(replaced)}


def find_id_in_other_catalogs(item_id: str, target_catalog: Path) -> Path | None:
    """Return another catalog file already containing item_id, if any.

    The prototype manager merges every catalog, so the same ID in two files
    crashes the server even when each file alone is fine.
    """
    target = target_catalog.resolve()
    for catalog_file in discover_catalogs():
        if catalog_file.resolve() == target or not catalog_file.exists():
            continue
        for entry in load_yaml(catalog_file):
            if isinstance(entry, dict) and entry.get("id") == item_id:
                return catalog_file
    return None


def extract_file_name(item: dict[str, Any]) -> str | None:
    path_value = item.get("path", {}).get("path")
    if not isinstance(path_value, str):
        return None
    return Path(path_value).name or None


def remove_attribution_entries(file_name: str, audio_dir: Path | None = None) -> int:
    attributions_path = attributions_for(audio_dir or AUDIO_DIR)
    if not attributions_path.exists():
        return 0
    attributions_data = load_yaml(attributions_path)
    kept_entries: list[dict[str, Any]] = []
    removed = 0
    for entry in attributions_data:
        files = entry.get("files", [])
        if isinstance(files, list) and file_name in files:
            removed += 1
            continue
        kept_entries.append(entry)

    if removed:
        save_yaml(attributions_path, kept_entries)
    return removed


def audio_dir_for_resource_path(resource_path: str) -> Path:
    """Map a prototype /Audio/... path back to its filesystem dir.

    Lets Remove work even when the entry lives in a custom/private dir
    instead of the currently configured default.
    """
    cleaned = (resource_path or "").strip()
    if cleaned.startswith("/"):
        return (CONTENT_ROOT / ("Resources" + cleaned)).resolve().parent
    return AUDIO_DIR


def open_folder(path: Path) -> None:
    if path.exists():
        subprocess.Popen(["explorer", str(path)])


def parse_audio_paths(raw_input: str) -> list[Path]:
    normalized = raw_input.replace("\r", "\n").replace(";", "\n")
    lines = [line.strip() for line in normalized.split("\n") if line.strip()]
    paths: list[Path] = []

    for line in lines:
        # Handles quoted drag-drop paths while keeping unquoted Windows paths intact.
        quoted_paths = re.findall(r'"([^"]+)"|\'([^\']+)\'', line)
        if quoted_paths:
            for double_quoted, single_quoted in quoted_paths:
                cleaned = (double_quoted or single_quoted).strip()
                if cleaned:
                    paths.append(Path(cleaned))
            continue

        cleaned = re.sub(r"\\ ", " ", line.strip().strip('"').strip("'"))
        if cleaned:
            paths.append(Path(cleaned))
    return paths


class FileInputScreen(ModalScreen[tuple[str, str] | None]):
    CSS = """
    FileInputScreen {
        align: center middle;
    }
    #dialog {
        width: 80;
        height: auto;
        border: round #569cd6;
        background: #1b1f23;
        padding: 1 2;
    }
    #dialog-title {
        text-style: bold;
        margin-bottom: 1;
    }
    #help {
        color: #9aa7b2;
        margin-top: 1;
    }
    #buttons {
        margin-top: 1;
        height: auto;
    }
    """

    def __init__(self, default_variant: str = "") -> None:
        super().__init__()
        self.default_variant = default_variant

    def compose(self) -> ComposeResult:
        with Container(id="dialog"):
            yield Label("Add Audio Files", id="dialog-title")
            yield Input(placeholder=r"Paste one or more audio paths separated by ;", id="ogg-input")
            yield Input(
                placeholder="Variant (empty = default, e.g. _MegaHetero, public)",
                value=self.default_variant,
                id="variant-input",
            )
            yield Static(
                "Variant examples:\n"
                "  (empty)      -> default from .env\n"
                "  public       -> Resources/Audio/Jukebox (public)\n"
                "  _MegaHetero  -> Resources/Audio/_MegaHetero/Jukebox (private)",
                id="help",
            )
            with Horizontal(id="buttons"):
                yield Button("Cancel", id="cancel")
                yield Button("Browse...", id="browse")
                yield Button("Add", variant="primary", id="submit")

    @on(Button.Pressed, "#cancel")
    def cancel(self) -> None:
        self.dismiss(None)

    @on(Button.Pressed, "#browse")
    def browse(self) -> None:
        root = tk.Tk()
        root.withdraw()
        root.attributes("-topmost", True)
        file_paths = filedialog.askopenfilenames(
            title="Select audio files",
            filetypes=[
                ("Audio files", "*.ogg *.mp3 *.wav *.flac *.aac *.m4a *.wma *.opus"),
                ("All files", "*.*"),
            ],
        )
        root.destroy()
        if file_paths:
            self.query_one("#ogg-input", Input).value = ";".join(file_paths)

    @on(Button.Pressed, "#submit")
    def submit(self) -> None:
        value = self.query_one("#ogg-input", Input).value.strip()
        variant = self.query_one("#variant-input", Input).value.strip()
        self.dismiss((value, variant) if value else None)


class JukeboxApp(App[None]):
    CSS = """
    Screen {
        background: #111418;
    }
    #main {
        padding: 1 2;
    }
    #title {
        text-style: bold;
        color: #8ec07c;
        margin-bottom: 1;
    }
    #paths {
        color: #9aa7b2;
        margin-bottom: 1;
    }
    #status {
        color: #f0c674;
        margin-top: 1;
    }
    #controls {
        margin-top: 1;
        height: auto;
    }
    ListView {
        border: round #4b5563;
        height: 1fr;
    }
    """

    BINDINGS = [
        ("a", "add_files", "Add Audio"),
        ("d", "remove_selected", "Remove Selected"),
        ("c", "open_catalog", "Open Catalog"),
        ("u", "open_audio", "Open Audio"),
        ("r", "refresh", "Refresh"),
        ("q", "quit", "Quit"),
    ]

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True)
        with Vertical(id="main"):
            yield Label("Jukebox Manager", id="title")
            yield Static(
                f"Default catalog: {CATALOG_PATH}\nAudio: {AUDIO_DIR}\nVariant: {RESOURCE_VARIANT or '(default)'}\n"
                "List is grouped by catalog. Select a row first: Open buttons follow "
                "the selection, Remove needs a track row.",
                id="paths",
            )
            yield ListView(id="jukebox-list")
            with Horizontal(id="controls"):
                yield Button("Add Audio Files", id="add", variant="primary")
                yield Button("Remove Selected", id="remove", variant="error")
                yield Button("Open Catalog Folder", id="catalog")
                yield Button("Open Audio Folder", id="audio")
                yield Button("Refresh", id="refresh")
            yield Static("Ready.", id="status")
        yield Footer()

    def on_mount(self) -> None:
        # Rows of the grouped list: ("header", tag, catalog_path) separators and
        # ("track", catalog entry, source catalog file) items.
        self.catalog_rows: list[tuple[str, Any, Path]] = []
        self.refresh_list()

    def ordered_catalogs(self) -> list[Path]:
        """Discovered catalogs with the configured default first, rest by tag."""
        catalogs = discover_catalogs()
        default = CATALOG_PATH.resolve()
        return sorted(catalogs, key=lambda c: (c.resolve() != default, catalog_variant_tag(c)))

    def selected_row(self) -> tuple[str, Any, Path] | None:
        list_view = self.query_one("#jukebox-list", ListView)
        index = list_view.index
        if index is None or index < 0 or index >= len(self.catalog_rows):
            return None
        return self.catalog_rows[index]

    def refresh_list(self) -> None:
        list_view = self.query_one("#jukebox-list", ListView)
        list_view.clear()
        self.catalog_rows = []

        catalogs = self.ordered_catalogs()
        existing = [c for c in catalogs if c.exists()]
        total_tracks = 0
        for catalog_file in existing:
            tag = catalog_variant_tag(catalog_file)
            tracks = [
                item for item in load_yaml(catalog_file)
                if isinstance(item, dict) and item.get("type") == "jukebox"
            ]
            total_tracks += len(tracks)
            self.catalog_rows.append(("header", tag, catalog_file))
            list_view.append(
                ListItem(
                    Label(
                        f"== [{tag}] {display_path(catalog_file)} "
                        f"({len(tracks)} track(s)) =="
                    )
                )
            )
            for item in tracks:
                self.catalog_rows.append(("track", item, catalog_file))
                item_id = item.get("id", "unknown")
                item_name = item.get("name", "unknown")
                list_view.append(ListItem(Label(f"  {item_id}: {item_name}")))

        if not existing:
            self.set_status(f"No catalog files found (default: {CATALOG_PATH})")
        else:
            self.set_status(
                f"List updated: {total_tracks} track(s) in {len(existing)} catalog(s)."
            )

    def set_status(self, message: str) -> None:
        self.query_one("#status", Static).update(message)

    def action_refresh(self) -> None:
        self.refresh_list()

    def action_open_catalog(self) -> None:
        row = self.selected_row()
        catalog_file = row[2] if row is not None else CATALOG_PATH
        catalog_dir = catalog_file.parent
        catalog_dir.mkdir(parents=True, exist_ok=True)
        open_folder(catalog_dir)
        self.set_status(f"Opened: {catalog_dir}")

    def action_open_audio(self) -> None:
        row = self.selected_row()
        audio_dir = audio_dir_for_catalog(row[2]) if row is not None else AUDIO_DIR
        audio_dir.mkdir(parents=True, exist_ok=True)
        open_folder(audio_dir)
        self.set_status(f"Opened: {audio_dir}")

    def action_add_files(self) -> None:
        self.push_screen(
            FileInputScreen(default_variant=RESOURCE_VARIANT),
            self.process_add_input,
        )

    def action_remove_selected(self) -> None:
        row = self.selected_row()
        if row is None:
            self.set_status("Select a track first.")
            return
        kind, payload, source_catalog = row
        if kind != "track":
            self.set_status("That row is a catalog header — select a track below it.")
            return
        selected_item = payload
        file_name = extract_file_name(selected_item)
        if not file_name:
            self.set_status("Could not resolve file for selected entry.")
            return

        # Rewrite only the source catalog, keeping other catalogs untouched.
        source_items = [
            item for kind_, item, src in self.catalog_rows
            if kind_ == "track" and src == source_catalog and item is not selected_item
        ]
        save_yaml(source_catalog, source_items)

        # The entry may point to a custom/private dir; resolve from its /Audio/... path.
        raw_path = (selected_item.get("path", {}) or {}).get("path", "")
        entry_audio_dir = audio_dir_for_resource_path(raw_path) if raw_path else AUDIO_DIR
        audio_file = entry_audio_dir / file_name
        deleted_audio = False
        if audio_file.exists():
            audio_file.unlink()
            deleted_audio = True

        removed_attributions = remove_attribution_entries(file_name, entry_audio_dir)
        self.refresh_list()
        self.set_status(
            f"Removed {file_name}. Audio deleted: {'yes' if deleted_audio else 'no'}. "
            f"Attributions removed: {removed_attributions}."
        )

    def on_paste(self, event: events.Paste) -> None:
        parsed = parse_audio_paths(event.text)
        if any(path.suffix.lower() in SUPPORTED_AUDIO_EXTENSIONS for path in parsed):
            self.process_add_input((event.text, ""))
            event.stop()

    @on(Button.Pressed, "#add")
    def on_add_pressed(self) -> None:
        self.action_add_files()

    @on(Button.Pressed, "#catalog")
    def on_catalog_pressed(self) -> None:
        self.action_open_catalog()

    @on(Button.Pressed, "#remove")
    def on_remove_pressed(self) -> None:
        self.action_remove_selected()

    @on(Button.Pressed, "#audio")
    def on_audio_pressed(self) -> None:
        self.action_open_audio()

    @on(Button.Pressed, "#refresh")
    def on_refresh_pressed(self) -> None:
        self.action_refresh()

    def process_add_input(self, result: tuple[str, str] | str | None) -> None:
        if not result:
            self.set_status("No files provided.")
            return

        # Back-compat: older callers passed just the raw paths string.
        if isinstance(result, str):
            raw_paths, variant_input = result, ""
        else:
            raw_paths, variant_input = result
        if not raw_paths:
            self.set_status("No files provided.")
            return

        # Variant name (e.g. '_MegaHetero', 'public', empty = default);
        # full dir paths still work and map to their mirrored catalog.
        target_audio, target_catalog = resolve_add_target(variant_input)

        failures: list[str] = []
        added = 0
        updated = 0
        for source_file in parse_audio_paths(raw_paths):
            if not source_file.exists() or source_file.suffix.lower() not in SUPPORTED_AUDIO_EXTENSIONS:
                failures.append(source_file.name or str(source_file))
                continue

            item_id = source_file.stem.replace(" ", "_")
            clash = find_id_in_other_catalogs(item_id, target_catalog)
            if clash is not None:
                failures.append(
                    f"{source_file.name} (ID '{item_id}' already in "
                    f"[{catalog_variant_tag(clash)}] — remove it there first)"
                )
                continue

            try:
                info = import_audio_to_resources(source_file, target_audio, target_catalog)
                if info.get("replaced") == "True":
                    updated += 1
                else:
                    added += 1
            except Exception:
                failures.append(source_file.name)

        self.refresh_list()

        dest_label = f"[{catalog_variant_tag(target_catalog)}] {display_path(target_audio)}"
        parts = [f"Added {added}"]
        if updated:
            parts.append(f"updated {updated}")
        summary = ", ".join(parts) + f" file(s) to {dest_label}"
        if failures:
            self.set_status(f"{summary}. Failed: {', '.join(failures)}")
        else:
            self.set_status(f"{summary} successfully.")


if __name__ == "__main__":
    JukeboxApp().run()
