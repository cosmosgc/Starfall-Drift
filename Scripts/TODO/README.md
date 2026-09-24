# Warning cleanup TODO — overview

Source: `Scripts/logs/Content.Tests.log` — **711 warning lines** total.

## Counts by project

| Project file | Warnings | Fix file |
|---|---|---|
| `Content:Content.Client` | 224 | [Content.Client.md](./Content.Client.md) |
| `Content:Content.Server` | 210 | [Content.Server.md](./Content.Server.md) |
| `Content:Content.Shared` | 137 | [Content.Shared.md](./Content.Shared.md) |
| `RobustToolbox:Robust.Client` | 73 | [RobustToolbox.md](./RobustToolbox.md) |
| `RobustToolbox:Robust.Shared` | 55 | [RobustToolbox.md](./RobustToolbox.md) |
| `Content:Content.Tests` | 6 | [Content.Tests.md](./Content.Tests.md) |
| `Unknown` | 4 | [Other.md](./Other.md) |
| `RobustToolbox:Robust.Shared.Scripting` | 1 | [RobustToolbox.md](./RobustToolbox.md) |
| `RobustToolbox:Robust.Server` | 1 | [RobustToolbox.md](./RobustToolbox.md) |

## Top warning messages (all projects)

| Count | Code | Message |
|---|---|---|
| 117 | CS0618 | Controls should only be removed from UI tree instead of being disposed |
| 67 | CS0618 | Update your API to allow accessing Owner through other means |
| 65 | CS0618 | Will be replaced with damage-model specific events; general  |
| 56 | CS0618 | Do not rely on the ability to determine a numerically quantifiable amount of damage |
| 49 | CS0618 | Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functional... |
| 44 | CS0618 | Do not rely on DamageGroupPrototype for anything besides grouping logically similar damage... |
| 30 | CS0618 | Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required |
| 23 | CS0618 | Please use the new sheetlet system to define styles, and remove all references to this cla... |
| 19 | CS0612 |  |
| 18 | CS0618 | Use ISawmill.Error |
| 17 | CS0618 | String literals for sounds are deprecated, use a SoundSpecifier or ResolvedSoundSpecifier ... |
| 16 | CS0618 | Use ISawmill.Warning |
| 11 | CS0618 | Solution string matching will be removed in the future in favor of relations and enumerato... |
| 7 | CS0618 | Use an event-relay based approach instead |
| 7 | CS0618 | Use Entity<T> method instead |
| 6 | CS0618 | Stop using font prototypes |
| 6 | CS0618 | Use ContainerFillComponent or EntityTableContainerFillComponent instead |
| 5 | CS0618 | Use EntityLookupSystem |
| 5 | CS0618 | Do not pre-load grids. This causes the server to have to keep that grid loaded in memory d... |
| 4 | NU1510 | PackageReference System.Text.Json will not be pruned. Consider removing this package from ... |
| 4 | CS0618 | Use ISawmill.Debug |
| 4 | CS0618 | Use SpriteSystem.LayerSetRsiState() instead. |
| 4 | CS0618 | Use SpriteSystem.SetColor() instead. |
| 4 | CS0618 | Use SharedTransformSystem.GetGrid() |
| 4 | CS0618 | Use IPlacementManager.AllModeNames |
| 3 | CS0618 | Use the SharedTransformSystem.AnchorEntity/Unanchor methods instead. |
| 3 | CS0618 | Use ISawmill.Log |
| 3 | CS0618 | Use IMarkupTagHandler |
| 3 | CS0618 | Dont use async DoAfters |
| 3 | CS0618 | Do not access the underlying implementation |
| 3 | CS0618 | Do not rely on the ability to determine if an entity will be able to be damaged by somethi... |
| 2 | NU1510 | PackageReference Microsoft.Win32.Registry will not be pruned. Consider removing this packa... |
| 2 | NU1510 | PackageReference System.Reflection.Metadata will not be pruned. Consider removing this pac... |
| 2 | CS0618 | Use the system method instead |
| 2 | CS0618 | use override with EntityUid |

## Strategy

1. **Do NOT touch gameplay-semantics warnings yet**: `DamageChangedEvent`, `GetTotalDamage/GetAllDamage/GetDamagePerGroup`, `DamageGroupPrototype`, old `StatusEffectsSystem` — these need upstream-aligned refactors. They are the bulk of Content.Shared/Server noise.
2. **Safe mechanical batches first**: CS0672 `Dispose(bool)` -> `ExitedTree()` + `Control.Dispose()` -> `Orphan()/RemoveChild()/Close()`; `Logger.*` -> `ISawmill`; `Entity<T>` overloads; `SpriteSystem.*`; `SharedTransformSystem.*`; `SoundSpecifier`; `FormattedMessage.TryFromMarkup`.
3. **Medium batches**: `IRobustRandom` migration, `StyleNano` -> sheetlets, solution-container string API, container-fill components, event-relay body queries.
4. **RobustToolbox.md is upstream engine code** (submodule). Fix there only by bumping the submodule or PRing upstream — do not diverge the fork. Listed separately for that reason.
5. Rebuild after each batch and diff `Scripts/logs/Content.Tests.log` to confirm the count drops.

