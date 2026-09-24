# RobustToolbox — upstream warnings (DO NOT DIVERGE)

_These warnings live in the `RobustToolbox` submodule (engine). Prefer fixing by updating the submodule or PRing upstream, not by patching the fork copy._

Total: **130**

## `RobustToolbox:Robust.Shared` [CS0618] Component.Owner — 25x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Containers\ContainerManagerComponent.cs(31,43)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(144,31)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(166,68)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(167,31)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(173,73)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(316,64)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\Systems\FixtureSystem.cs(206,61)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\Systems\SharedBroadphaseSystem.cs(396,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\Systems\SharedPhysicsSystem.Island.cs(335,27)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(172,66)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(302,102)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(313,58)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(430,67)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(431,94)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(432,27)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(577,34)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(583,59)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(586,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(599,35)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(613,31)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(622,56)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(700,30)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(763,48)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.cs(800,86)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\EntityLookupSystem.LocalQueries.cs(143,38)`

## `RobustToolbox:Robust.Client` [CS0618] Control.Dispose() — 13x

> Controls should only be removed from UI tree instead of being disposed

**Fix hint:** Replace `control.Dispose()` with `control.Orphan()` (or `parent.RemoveChild(c)` / `window.Close()` for windows). Replace `protected override void Dispose(bool)` with `protected override void ExitedTree()` and move cleanup there. Add no `[Obsolete]` — fix properly. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Instances\ViewVariablesInstanceEntity.cs(372,33)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Instances\ViewVariablesInstanceEntity.cs(383,33)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Editors\VVPropEditorIPrototype.cs(64,24)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\ClientViewVariablesManager.cs(126,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Editors\VVPropEditorIPrototype.cs(113,24)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\ClientViewVariablesManager.cs(208,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Control.cs(643,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\VerticalTabContainer.xaml.cs(62,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\UserInterfaceManager.Windows.cs(32,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\UserInterfaceManager.Windows.cs(65,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\UserInterfaceManager.Windows.cs(114,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\SpinBox.cs(189,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\SpinBox.cs(194,17)`

## `RobustToolbox:Robust.Client` [CS0618] Logger.Error(string) — 12x

> Use ISawmill.Error

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Animations\AnimationTrackComponentProperty.cs(29,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Graphics\Shaders\ShaderPrototype.cs(71,29)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(152,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(157,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(158,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(159,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(160,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(161,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(162,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(163,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\WordWrap.cs(164,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Themes\UiTheme.cs(52,9)`

## `RobustToolbox:Robust.Shared` [CS0618] IComponent.Owner — 7x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\ComponentTreeEntry.cs(16,29)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(333,31)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(334,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(686,27)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(1183,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(1714,42)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.Components.cs(1725,50)`

## `RobustToolbox:Robust.Client` [CS0618] FontTag.CreateFont(Stack<Font>, MarkupNode, IResourceCache, IPrototypeManager, string) — 5x

> Stop using font prototypes

**Fix hint:** Remove `FontTag.CreateFont` prototype usage; use engine font resources directly. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\BoldItalicTag.cs(20,20)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\ItalicTag.cs(21,20)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\BoldTag.cs(21,20)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\HeadingTag.cs(27,20)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\FontTag.cs(30,20)`

## `RobustToolbox:Robust.Shared` [CS0618] Logger.Debug(string) — 3x

> Use ISawmill.Debug

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\ReflectionExtensions.cs(229,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\ReflectionExtensions.cs(230,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\ReflectionExtensions.cs(233,13)`

## `RobustToolbox:Robust.Shared` [CS0618] Logger.DebugS(string, string) — 3x

> Use ISawmill.Log

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\Syntax\ParserContext.cs(175,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\Syntax\ParserContext.cs(176,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Toolshed\Syntax\ParserContext.cs(186,9)`

## `RobustToolbox:Robust.Client` [CS0618] IMarkupTag — 3x

> Use IMarkupTagHandler

**Fix hint:** Implement `IMarkupTagHandler` instead of obsolete `IMarkupTag`. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\MarkupDrawingContext.cs(11,26)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\MarkupDrawingContext.cs(17,25)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\MarkupDrawingContext.cs(24,25)`

## `RobustToolbox:Robust.Client` [CS0618] SharedPhysicsSystem.GetCollidingEntities(MapId, in Box2Rotated) — 3x

> Use EntityLookupSystem

**Fix hint:** Replace `SharedPhysicsSystem.GetCollidingEntities(...)` with `EntityLookupSystem` queries (`GetEntitiesInRange`, `IntersectRay`, etc.). (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Debugging\DebugPhysicsSystem.cs(244,42)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Debugging\DebugPhysicsSystem.cs(288,42)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Debugging\DebugPhysicsSystem.cs(309,42)`

## `RobustToolbox:Robust.Client` [CS0618] Logger.WarningS(string, string) — 3x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Editors\VVPropEditorDummy.cs(17,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\CustomControls\BaseWindow.cs(214,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\DevWindow\ProfTree.xaml.cs(56,13)`

## `RobustToolbox:Robust.Shared` [CS0618] TransformComponent.Anchored.set — 2x

> Use the SharedTransformSystem.AnchorEntity/Unanchor methods instead.

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\SharedTransformSystem.Component.cs(864,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\EntityManager.cs(354,17)`

## `RobustToolbox:Robust.Shared` [CS0618] SharedTransformSystem.SetLocalRotation(TransformComponent, Angle) — 2x

> use override with EntityUid

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\SharedTransformSystem.Component.cs(1196,9)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\SharedTransformSystem.Component.cs(1210,9)`

## `RobustToolbox:Robust.Shared` [CS0618] SharedPhysicsSystem.SetAwake(EntityUid, PhysicsComponent, bool, bool) — 2x

> Use SetAwake with EntityUid<PhysicsComponent>

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\Systems\SharedPhysicsSystem.Island.cs(380,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Physics\Systems\SharedPhysicsSystem.Island.cs(1142,13)`

## `RobustToolbox:Robust.Shared` [CS0618] Logger.ErrorS(string, string) — 2x

> Use ISawmill.Error

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Serialization\Manager\Definition\DataDefinition.cs(347,21)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Serialization\Manager\Definition\DataDefinition.cs(395,17)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.Offset.set — 2x

> Use SpriteSystem.SetOffset() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(196,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(219,17)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.Scale.set — 2x

> Use SpriteSystem.SetScale() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(204,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(218,17)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.Rotation.set — 2x

> Use SpriteSystem.SetRotation() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(211,17)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Console\Commands\UITestCommand.TabSpriteView.cs(220,17)`

## `RobustToolbox:Robust.Client` [CS0618] Control.Dispose(bool) — 2x

> Controls should only be removed from UI tree instead of being disposed

**Fix hint:** Replace `control.Dispose()` with `control.Orphan()` (or `parent.RemoveChild(c)` / `window.Close()` for windows). Replace `protected override void Dispose(bool)` with `protected override void ExitedTree()` and move cleanup there. Add no `[Obsolete]` — fix properly. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\BaseButton.cs(399,13)`
- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\CustomControls\DefaultWindow.xaml.cs(131,13)`

## `RobustToolbox:Robust.Shared` [CS0618] Logger.Warning(string) — 1x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Containers\ContainerSlot.cs(75,17)`

## `RobustToolbox:Robust.Shared` [CS0618] ComponentTreeSystem<TTreeComp, TComp>.QueryAabb(HashSet<ComponentTreeEntry<TComp>>, MapId, Box2Rotated, bool) — 1x

> Use Entity<T> variant

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\ComponentTrees\ComponentTreeSystem.cs(346,9)`

## `RobustToolbox:Robust.Shared` [CS0618] RandomHelpers.NextByte(Random, byte) — 1x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Map\TileDefinitionManager.cs(63,54)`

## `RobustToolbox:Robust.Shared` [CS0618] TransformComponent.WorldPosition — 1x

> Use the system method instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(530,72)`

## `RobustToolbox:Robust.Shared` [CS0618] TransformComponent.WorldRotation — 1x

> Use the system method instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Components\Transform\TransformComponent.cs(530,88)`

## `RobustToolbox:Robust.Shared` [CS0618] Logger.WarningS(string, string) — 1x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Network\Messages\MsgConVars.cs(26,17)`

## `RobustToolbox:Robust.Shared` [CS0618] EntitySystem.TryGet<T>(out T?) — 1x

> Either use a dependency, resolve and cache IEntityManager manually, or use EntityManager.System<T>()

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Player\Filter.cs(279,20)`

## `RobustToolbox:Robust.Shared` [CS0618] MetaDataComponent.EntityPrototype.set — 1x

> Use MetaDataSystem.SetEntityPrototype

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\GameObjects\Systems\PrototypeReloadSystem.cs(81,9)`

## `RobustToolbox:Robust.Shared` [CS0618] ValidatePrototypeIdAttribute<> — 1x

> Use a static readonly ProtoId<T> instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared\Prototypes\PrototypeManager.ValidateFields.cs(180,54)`

## `RobustToolbox:Robust.Shared.Scripting` [CS0618] Classifier.GetClassifiedSpans(SemanticModel, TextSpan, Workspace, CancellationToken) — 1x

> Use GetClassifiedSpansAsync instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Shared.Scripting\ScriptInstanceShared.cs(111,30)`

## `RobustToolbox:Robust.Server` [CS0618] Component.Owner — 1x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Server\ViewVariables\ViewVariablesSession.cs(104,37)`

## `RobustToolbox:Robust.Client` [CS0672] (no member) — 1x

> Member 'BaseButton.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'BaseButton.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Robust.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\BaseButton.cs(397,33)`

## `RobustToolbox:Robust.Client` [CS0672] (no member) — 1x

> Member 'DefaultWindow.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'DefaultWindow.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Robust.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\CustomControls\DefaultWindow.xaml.cs(129,33)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerGetActualRSI(object) — 1x

> Use SpriteSystem.LayerGetEffectiveRsi() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Animations\AnimationTrackSpriteFlick.cs(58,27)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerSetAutoAnimated(object, bool) — 1x

> Use SpriteSystem.LayerSetAutoAnimated() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Animations\AnimationTrackSpriteFlick.cs(62,21)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerSetState(object, RSI.StateId) — 1x

> Use SpriteSystem.LayerSetRsiState() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Animations\AnimationTrackSpriteFlick.cs(65,21)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerSetAnimationTime(object, float) — 1x

> Use SpriteSystem.LayerSetAnimationTime() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Animations\AnimationTrackSpriteFlick.cs(66,21)`

## `RobustToolbox:Robust.Client` [CS0618] SharedPhysicsSystem.GetCollidingEntities(MapId, in Box2) — 1x

> Use EntityLookupSystem

**Fix hint:** Replace `SharedPhysicsSystem.GetCollidingEntities(...)` with `EntityLookupSystem` queries (`GetEntitiesInRange`, `IntersectRay`, etc.). (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Debugging\DebugPhysicsSystem.cs(396,42)`

## `RobustToolbox:Robust.Client` [CS0618] Component.Owner — 1x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Debugging\DebugPhysicsSystem.cs(398,31)`

## `RobustToolbox:Robust.Client` [CS0612] SpriteComponent.Layer.Layer(SpriteComponent.Layer, SpriteComponent) — 1x

**Fix hint:** Check obsolete attribute on the named member for its replacement; migrate to the new API. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\SpriteSystem.Component.cs(77,25)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteSystem.QueueUpdateInert(EntityUid, SpriteComponent) — 1x

> Use QueueUpdateIsInert

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\SpriteSystem.cs(79,13)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteSpecifierExt.GetTexture(SpriteSpecifier.Texture, IResourceCache) — 1x

> Use SpriteSystem.GetTexture() instead

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\SpriteSystem.cs(223,30)`

## `RobustToolbox:Robust.Client` [CS0618] Logger.ErrorS(string, string, params object?[]) — 1x

> Use ISawmill.Error

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Graphics\Shaders\ShaderPrototype.cs(131,33)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.ContainerOccluded.set — 1x

> Use SpriteSystem.SetContainerOccluded() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\ContainerSystem.cs(330,17)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.Color.set — 1x

> Use SpriteSystem.SetColor() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Placement\PlacementMode.cs(127,17)`

## `RobustToolbox:Robust.Client` [CS0618] IMapManager.MapExists(MapId?) — 1x

> Use MapSystem

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Graphics\Clyde\Clyde.GridRendering.cs(55,18)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerMapReserveBlank(object) — 1x

> Use SpriteSystem.LayerMapReserve() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\GenericVisualizerSystem.cs(39,34)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.LayerSetData(int, PrototypeLayerData) — 1x

> Use SpriteSystem.LayerSetData() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\GameObjects\EntitySystems\GenericVisualizerSystem.cs(40,17)`

## `RobustToolbox:Robust.Client` [CS0618] Logger.Debug(string) — 1x

> Use ISawmill.Debug

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\State\StateManager.cs(41,13)`

## `RobustToolbox:Robust.Client` [CS0618] EntityCoordinates.GetGridUid(IEntityManager) — 1x

> Use SharedTransformSystem.GetGrid()

**Fix hint:** Use `SharedTransformSystem` (`ToMapCoordinates`, `GetMapId`, `GetGrid`, `AnchorEntity/Unanchor`, `SetLocalRotation(EntityUid, ...)`) instead of `EntityCoordinates`/`TransformComponent` direct APIs. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\ViewVariables\Editors\VVPropEditorEntityCoordinates.cs(34,24)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteSpecifierExt.RsiStateLike(SpriteSpecifier) — 1x

> Use SpriteSystem.RsiStateLike() instead

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\AnimatedTextureRect.cs(39,22)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.Render(DrawingHandleWorld, Angle, Angle, Direction?, Vector2) — 1x

> Use SpriteSystem.Render() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Graphics\Clyde\Clyde.RenderHandle.cs(210,17)`

## `RobustToolbox:Robust.Client` [CS0184] (no member) — 1x

> The given expression is never of the provided ('BoldTag') type [G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Robust.Client.csproj]

**Fix hint:** CS0184: fix impossible type check (`is BoldTag` on `ItalicTag` etc.) — logic bug, correct the type test. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\ItalicTag.cs(22,42)`

## `RobustToolbox:Robust.Client` [CS0184] (no member) — 1x

> The given expression is never of the provided ('ItalicTag') type [G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Robust.Client.csproj]

**Fix hint:** CS0184: fix impossible type check (`is BoldTag` on `ItalicTag` etc.) — logic bug, correct the type test. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\RichText\BoldTag.cs(22,42)`

## `RobustToolbox:Robust.Client` [CS0618] Logger.Warning(string) — 1x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Screens\DebugBuiltinConnectionScreen.xaml.cs(83,13)`

## `RobustToolbox:Robust.Client` [CS0618] SharedTransformSystem.GetRelativePositionRotation(TransformComponent, EntityUid, EntityQuery<TransformComponent>) — 1x

> Use variant without entity query

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\Graphics\Clyde\Clyde.Sprite.cs(131,30)`

## `RobustToolbox:Robust.Client` [CS0618] SpriteComponent.CalculateRotatedBoundingBox(Vector2, Angle, Angle) — 1x

> Use SpriteSystem.CalculateBounds() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject. (upstream)

- [ ] `G:\Servers\ss14\Starfall-Drift\RobustToolbox\Robust.Client\UserInterface\Controls\SpriteView.cs(188,29)`
