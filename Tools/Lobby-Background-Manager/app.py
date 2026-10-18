"""Lobby Background Manager — Estação Mega Hetero / SS14.

Modeled on Tools/Jukebox-Manager/app.py (Textual TUI).

O que faz:
- Importa imagens (png/jpg/jpeg/webp/bmp/tga) para
  Resources/Textures/<variant>/LobbyScreens como .webp 1920x1080 (via ffmpeg,
  com fallback para Pillow ou cópia direta).
- Cria o sidecar `<arquivo>.yml` com `sample: filter: false`.
- Acrescenta entradas `lobbyBackground` em
  Resources/Prototypes/<variant>/lobbyscreens.yml.
- Cria/atualiza títulos e artistas em
  Resources/Locale/en-US/<variant>/lobbyscreens.ftl e
  Resources/Locale/pt-BR/<variant>/lobbyscreens.ftl.
- Cria entradas padrão em Textures/.../LobbyScreens/attributions.yml.
- Remove prototype + imagem + sidecar + linhas de locale + attributions de um só lugar.

Variante de resources (igual ao Jukebox-Manager):
  RESOURCE_VARIANT=_MegaHetero  -> escreve nos paths _MegaHetero
  RESOURCE_VARIANT=             -> escreve nos paths padrão (LobbyScreens / Prototypes)
"""

import os
import re
import shutil
import subprocess
import tkinter as tk
from pathlib import Path
from tkinter import filedialog
from typing import Any

import yaml
from dotenv import load_dotenv
from textual import events, on
from textual.app import App, ComposeResult
from textual.containers import Container, Horizontal, Vertical
from textual.screen import ModalScreen
from textual.widgets import Button, Footer, Header, Input, Label, ListItem, ListView, Static


load_dotenv()

ROOT_DIR = Path(__file__).resolve().parent
RESOURCE_VARIANT = os.getenv("RESOURCE_VARIANT", "").strip()
RESOURCE_VARIANT_SEGMENT = f"{RESOURCE_VARIANT}/" if RESOURCE_VARIANT else ""

TEXTURE_DIR = (ROOT_DIR / f"../../Resources/Textures/{RESOURCE_VARIANT_SEGMENT}LobbyScreens").resolve()
PROTO_DIR = (ROOT_DIR / f"../../Resources/Prototypes/{RESOURCE_VARIANT_SEGMENT}").resolve()
PROTO_PATH = PROTO_DIR / "lobbyscreens.yml"
ATTRIBUTIONS_PATH = TEXTURE_DIR / "attributions.yml"

LOCALE_EN_PATH = (ROOT_DIR / f"../../Resources/Locale/en-US/{RESOURCE_VARIANT_SEGMENT}lobbyscreens.ftl").resolve()
LOCALE_PT_PATH = (ROOT_DIR / f"../../Resources/Locale/pt-BR/{RESOURCE_VARIANT_SEGMENT}lobbyscreens.ftl").resolve()

# Quando RESOURCE_VARIANT está vazio, os locales padrão do upstream ficam em
# Locale/<lang>/lobby/lobby-state-background.ftl. Para não tocar nesses arquivos,
# o modo sem variante escreve em Locale/<lang>/lobbyscreens.ftl (novo arquivo,
# carregado automaticamente pelo jogo).
if not RESOURCE_VARIANT:
    LOCALE_EN_PATH = (ROOT_DIR / "../../Resources/Locale/en-US/lobbyscreens.ftl").resolve()
    LOCALE_PT_PATH = (ROOT_DIR / "../../Resources/Locale/pt-BR/lobbyscreens.ftl").resolve()

SUPPORTED_IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp", ".bmp", ".tga"}

SIDECAR_CONTENT = "sample:\n  filter: false\n"


def load_yaml(file_path: Path) -> list[dict[str, Any]]:
    if file_path.exists():
        with file_path.open("r", encoding="utf-8") as file:
            data = yaml.safe_load(file)
            if data is None:
                return []
            # Ignora linhas de comentário / entradas vazias.
            return [entry for entry in data if isinstance(entry, dict)]
    return []


def save_yaml(file_path: Path, data: list[dict[str, Any]]) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        yaml.safe_dump(data, file, sort_keys=False, allow_unicode=True)


def sanitize_id(stem: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9_]+", "_", stem.strip().replace(" ", "_").replace("-", "_"))
    cleaned = re.sub(r"_+", "_", cleaned).strip("_")
    return cleaned or "LobbyBackground"


def loc_key(proto_id: str, suffix: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", proto_id.lower()).strip("-")
    return f"lobby-state-background-{slug}-{suffix}"


def convert_image_to_webp(source_file: Path, dest_path: Path) -> str:
    """Converte/copia a imagem de origem para .webp. Retorna o método usado."""
    TEXTURE_DIR.mkdir(parents=True, exist_ok=True)
    dest_path.parent.mkdir(parents=True, exist_ok=True)

    ffmpeg = shutil.which("ffmpeg")
    if ffmpeg:
        try:
            subprocess.run(
                [
                    ffmpeg, "-y", "-i", str(source_file),
                    "-vf", "scale=1920:1080:force_original_aspect_ratio=decrease,"
                            "pad=1920:1080:(ow-iw)/2:(oh-ih)/2",
                    "-c:v", "libwebp", "-quality", "90",
                    str(dest_path),
                ],
                check=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE,
                text=True,
            )
            return "ffmpeg"
        except (subprocess.CalledProcessError, OSError):
            pass  # cai para os fallbacks abaixo

    try:
        from PIL import Image

        with Image.open(source_file) as img:
            img = img.convert("RGB")
            img.thumbnail((1920, 1080))
            canvas = Image.new("RGB", (1920, 1080), (0, 0, 0))
            canvas.paste(img, ((1920 - img.width) // 2, (1080 - img.height) // 2))
            canvas.save(dest_path, "WEBP", quality=90)
        return "pillow"
    except ImportError:
        pass

    if source_file.suffix.lower() == ".webp":
        shutil.copyfile(source_file, dest_path)
        return "copy"
    raise RuntimeError(
        f"Não foi possível converter {source_file.name}: "
        "instale ffmpeg (recomendado) ou `pip install pillow`."
    )


def upsert_locale_entries(title_key: str, artist_key: str, title: str, artist: str) -> None:
    for locale_path in (LOCALE_EN_PATH, LOCALE_PT_PATH):
        locale_path.parent.mkdir(parents=True, exist_ok=True)
        lines: list[str] = []
        if locale_path.exists():
            lines = locale_path.read_text(encoding="utf-8").splitlines()
        # Remove entradas antigas com as mesmas chaves.
        kept = [
            line for line in lines
            if not line.startswith(f"{title_key} =") and not line.startswith(f"{artist_key} =")
        ]
        if kept and kept[-1].strip() != "":
            kept.append("")
        kept.append(f"{title_key} = {title}")
        kept.append(f"{artist_key} = {artist}")
        locale_path.write_text("\n".join(kept) + "\n", encoding="utf-8")


def remove_locale_entries(title_key: str, artist_key: str) -> None:
    for locale_path in (LOCALE_EN_PATH, LOCALE_PT_PATH):
        if not locale_path.exists():
            continue
        lines = locale_path.read_text(encoding="utf-8").splitlines()
        kept = [
            line for line in lines
            if not line.startswith(f"{title_key} =") and not line.startswith(f"{artist_key} =")
        ]
        locale_path.write_text("\n".join(kept) + ("\n" if kept else ""), encoding="utf-8")


def update_attributions(file_name: str, artist: str) -> None:
    default_attribution = {
        "files": [file_name],
        "license": "CC-BY-SA-3.0",
        "copyright": f"{file_name} by {artist}.",
        "source": "Unknown",
    }
    attributions_data = load_yaml(ATTRIBUTIONS_PATH)
    attributions_data.append(default_attribution)
    save_yaml(ATTRIBUTIONS_PATH, attributions_data)


def remove_attribution_entries(file_name: str) -> int:
    if not ATTRIBUTIONS_PATH.exists():
        return 0
    attributions_data = load_yaml(ATTRIBUTIONS_PATH)
    kept_entries: list[dict[str, Any]] = []
    removed = 0
    for entry in attributions_data:
        files = entry.get("files", [])
        if isinstance(files, list) and file_name in files:
            removed += 1
            continue
        kept_entries.append(entry)
    if removed:
        save_yaml(ATTRIBUTIONS_PATH, kept_entries)
    return removed


def import_image_to_resources(source_file: Path, title: str, artist: str) -> dict[str, str]:
    proto_id = sanitize_id(source_file.stem)
    file_name = f"{proto_id}.webp"
    dest_path = TEXTURE_DIR / file_name
    method = convert_image_to_webp(source_file, dest_path)

    # Sidecar de amostragem (igual aos .webp.yml do upstream).
    (TEXTURE_DIR / f"{file_name}.yml").write_text(SIDECAR_CONTENT, encoding="utf-8")

    title_key = loc_key(proto_id, "title")
    artist_key = loc_key(proto_id, "artist")
    display_title = title.strip() or source_file.stem.replace("_", " ")
    display_artist = artist.strip() or "Unknown"

    resource_segment = f"/{RESOURCE_VARIANT}" if RESOURCE_VARIANT else ""
    new_entry = {
        "type": "lobbyBackground",
        "id": proto_id,
        "background": f"/Textures{resource_segment}/LobbyScreens/{file_name}",
        "title": title_key,
        "artist": artist_key,
    }

    yaml_data = load_yaml(PROTO_PATH)
    yaml_data = [e for e in yaml_data if e.get("id") != proto_id]
    yaml_data.append(new_entry)
    save_yaml(PROTO_PATH, yaml_data)

    upsert_locale_entries(title_key, artist_key, display_title, display_artist)
    update_attributions(file_name, display_artist)
    return {"id": proto_id, "file": file_name, "method": method}


def open_folder(path: Path) -> None:
    if path.exists():
        subprocess.Popen(["explorer", str(path)])


def parse_image_paths(raw_input: str) -> list[Path]:
    normalized = raw_input.replace("\r", "\n").replace(";", "\n")
    lines = [line.strip() for line in normalized.split("\n") if line.strip()]
    paths: list[Path] = []
    for line in lines:
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


class ImageInputScreen(ModalScreen[tuple[str, str, str] | None]):
    CSS = """
    ImageInputScreen {
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

    def compose(self) -> ComposeResult:
        with Container(id="dialog"):
            yield Label("Add Lobby Background", id="dialog-title")
            yield Input(placeholder=r"Paste one or more image paths separated by ;", id="img-input")
            yield Input(placeholder="Title (applies when adding a single image)", id="title-input")
            yield Input(placeholder="Artist (applies when adding a single image)", id="artist-input")
            yield Static("Tip: drag files into the terminal, or click Browse...", id="help")
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
            title="Select lobby background images",
            filetypes=[
                ("Image files", "*.png *.jpg *.jpeg *.webp *.bmp *.tga"),
                ("All files", "*.*"),
            ],
        )
        root.destroy()
        if file_paths:
            self.query_one("#img-input", Input).value = ";".join(file_paths)

    @on(Button.Pressed, "#submit")
    def submit(self) -> None:
        value = self.query_one("#img-input", Input).value.strip()
        title = self.query_one("#title-input", Input).value.strip()
        artist = self.query_one("#artist-input", Input).value.strip()
        self.dismiss((value, title, artist) if value else None)


class LobbyBackgroundApp(App[None]):
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
        ("a", "add_files", "Add Background"),
        ("d", "remove_selected", "Remove Selected"),
        ("c", "open_protos", "Open Prototypes"),
        ("u", "open_textures", "Open Textures"),
        ("r", "refresh", "Refresh"),
        ("q", "quit", "Quit"),
    ]

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True)
        with Vertical(id="main"):
            yield Label("Lobby Background Manager", id="title")
            yield Static(
                f"Prototypes: {PROTO_PATH}\nTextures: {TEXTURE_DIR}\n"
                f"Locale EN: {LOCALE_EN_PATH}\nLocale PT: {LOCALE_PT_PATH}\n"
                f"Variant: {RESOURCE_VARIANT or '(default)'}",
                id="paths",
            )
            yield ListView(id="bg-list")
            with Horizontal(id="controls"):
                yield Button("Add Background", id="add", variant="primary")
                yield Button("Remove Selected", id="remove", variant="error")
                yield Button("Open Prototypes Folder", id="protos")
                yield Button("Open Textures Folder", id="textures")
                yield Button("Refresh", id="refresh")
            yield Static("Ready.", id="status")
        yield Footer()

    def on_mount(self) -> None:
        self.bg_items: list[dict[str, Any]] = []
        self.refresh_list()

    def refresh_list(self) -> None:
        list_view = self.query_one("#bg-list", ListView)
        list_view.clear()

        if not PROTO_PATH.exists():
            self.bg_items = []
            self.set_status(f"Prototype file not found (will be created on add): {PROTO_PATH}")
            return

        self.bg_items = [e for e in load_yaml(PROTO_PATH) if e.get("type") == "lobbyBackground"]
        for item in self.bg_items:
            item_id = item.get("id", "unknown")
            background = item.get("background", "unknown")
            list_view.append(ListItem(Label(f"{item_id}: {background}")))
        self.set_status("List updated.")

    def set_status(self, message: str) -> None:
        self.query_one("#status", Static).update(message)

    def action_refresh(self) -> None:
        self.refresh_list()

    def action_open_protos(self) -> None:
        PROTO_DIR.mkdir(parents=True, exist_ok=True)
        open_folder(PROTO_DIR)
        self.set_status(f"Opened: {PROTO_DIR}")

    def action_open_textures(self) -> None:
        TEXTURE_DIR.mkdir(parents=True, exist_ok=True)
        open_folder(TEXTURE_DIR)
        self.set_status(f"Opened: {TEXTURE_DIR}")

    def action_add_files(self) -> None:
        self.push_screen(ImageInputScreen(), self.process_add_input)

    def action_remove_selected(self) -> None:
        list_view = self.query_one("#bg-list", ListView)
        selected_index = list_view.index
        if selected_index is None or selected_index < 0 or selected_index >= len(self.bg_items):
            self.set_status("Select an item first.")
            return

        selected_item = self.bg_items[selected_index]
        proto_id = str(selected_item.get("id", ""))
        background = str(selected_item.get("background", ""))
        file_name = Path(background).name if background else None
        title_key = str(selected_item.get("title", ""))
        artist_key = str(selected_item.get("artist", ""))

        remaining = [item for i, item in enumerate(load_yaml(PROTO_PATH)) if item.get("id") != proto_id]
        save_yaml(PROTO_PATH, remaining)

        deleted_image = False
        deleted_sidecar = False
        if file_name:
            image_file = TEXTURE_DIR / file_name
            if image_file.exists():
                image_file.unlink()
                deleted_image = True
            sidecar = TEXTURE_DIR / f"{file_name}.yml"
            if sidecar.exists():
                sidecar.unlink()
                deleted_sidecar = True

        if title_key or artist_key:
            remove_locale_entries(title_key, artist_key)
        removed_attributions = remove_attribution_entries(file_name) if file_name else 0

        self.refresh_list()
        self.set_status(
            f"Removed {proto_id}. Image deleted: {'yes' if deleted_image else 'no'}. "
            f"Sidecar deleted: {'yes' if deleted_sidecar else 'no'}. "
            f"Attributions removed: {removed_attributions}."
        )

    def on_paste(self, event: events.Paste) -> None:
        parsed = parse_image_paths(event.text)
        if any(path.suffix.lower() in SUPPORTED_IMAGE_EXTENSIONS for path in parsed):
            self.process_add_input((event.text, "", ""))
            event.stop()

    @on(Button.Pressed, "#add")
    def on_add_pressed(self) -> None:
        self.action_add_files()

    @on(Button.Pressed, "#protos")
    def on_protos_pressed(self) -> None:
        self.action_open_protos()

    @on(Button.Pressed, "#remove")
    def on_remove_pressed(self) -> None:
        self.action_remove_selected()

    @on(Button.Pressed, "#textures")
    def on_textures_pressed(self) -> None:
        self.action_open_textures()

    @on(Button.Pressed, "#refresh")
    def on_refresh_pressed(self) -> None:
        self.action_refresh()

    def process_add_input(self, result: tuple[str, str, str] | None) -> None:
        if not result:
            self.set_status("No files provided.")
            return
        raw_paths, title, artist = result
        failures: list[str] = []
        added = 0
        for source_file in parse_image_paths(raw_paths):
            if not source_file.exists() or source_file.suffix.lower() not in SUPPORTED_IMAGE_EXTENSIONS:
                failures.append(source_file.name or str(source_file))
                continue
            try:
                # Título/artista do diálogo valem para adição única; em lote usa o nome do arquivo.
                single = len(parse_image_paths(raw_paths)) == 1
                import_image_to_resources(
                    source_file,
                    title if single else source_file.stem.replace("_", " "),
                    artist if single else "Unknown",
                )
                added += 1
            except Exception as exc:
                failures.append(f"{source_file.name} ({exc})")

        self.refresh_list()
        if failures:
            self.set_status(f"Added {added} background(s). Failed: {', '.join(failures)}")
        else:
            self.set_status(f"Added {added} background(s) successfully.")


if __name__ == "__main__":
    LobbyBackgroundApp().run()
