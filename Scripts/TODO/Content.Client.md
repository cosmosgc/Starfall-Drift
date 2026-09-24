# Content.Client — warnings to fix (fork code, safe to edit)

_Source: `Scripts/logs/Content.Tests.log`. Fork-owned code — fix here. Checkboxes track progress._

Total in this file: **224**

## [CS0618] Control.Dispose() — 73x

> Controls should only be removed from UI tree instead of being disposed

**Fix hint:** Replace `control.Dispose()` with `control.Orphan()` (or `parent.RemoveChild(c)` / `window.Close()` for windows). Replace `protected override void Dispose(bool)` with `protected override void ExitedTree()` and move cleanup there. Add no `[Obsolete]` — fix properly.

- [ ] `Content.Client\Anomaly\Ui\AnomalyScannerBoundUserInterface.cs(46,15)`
- [ ] `Content.Client\Arcade\UI\BlockGameBoundUserInterface.cs(74,15)`
- [ ] `Content.Client\Administration\UI\BanList\BanListEui.cs(42,13)`
- [ ] `Content.Client\Administration\UI\BanList\RoleBans\RoleBanListControl.xaml.cs(23,13)`
- [ ] `Content.Client\Administration\UI\BanList\Bans\BanListControl.xaml.cs(23,13)`
- [ ] `Content.Client\Administration\UI\BanPanel\BanPanelEui.cs(40,9)`
- [ ] `Content.Client\Administration\UI\ManageSolutions\EditSolutionsWindow.xaml.cs(50,31)`
- [ ] `Content.Client\Access\UI\IdCardConsoleBoundUserInterface.cs(58,21)`
- [ ] `Content.Client\Atmos\UI\SpaceHeaterBoundUserInterface.cs(81,17)`
- [ ] `Content.Client\Administration\UI\ManageSolutions\EditSolutionsWindow.xaml.cs(275,31)`
- [ ] `Content.Client\Administration\UI\ManageSolutions\EditSolutionsWindow.xaml.cs(361,17)`
- [ ] `Content.Client\Administration\UI\Logs\AdminLogsEui.cs(176,9)`
- [ ] `Content.Client\Administration\UI\Logs\AdminLogsEui.cs(258,9)`
- [ ] `Content.Client\Administration\UI\Logs\AdminLogsEui.cs(259,20)`
- [ ] `Content.Client\Administration\UI\Logs\AdminLogsEui.cs(260,14)`
- [ ] `Content.Client\Administration\UI\ManageSolutions\AddReagentWindow.xaml.cs(80,17)`
- [ ] `Content.Client\Atmos\UI\GasFilterBoundUserInterface.cs(100,21)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlertsComputerBoundUserInterface.cs(47,15)`
- [ ] `Content.Client\Atmos\UI\GasCanisterBoundUserInterface.cs(84,21)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringConsoleBoundUserInterface.cs(38,15)`
- [ ] `Content.Client\Atmos\Monitor\UI\AirAlarmBoundUserInterface.cs(78,21)`
- [ ] `Content.Client\CartridgeLoader\CartridgeLoaderBoundUserInterface.cs(63,27)`
- [ ] `Content.Client\CartridgeLoader\CartridgeLoaderBoundUserInterface.cs(125,31)`
- [ ] `Content.Client\Cargo\BUI\CargoOrderConsoleBoundUserInterface.cs(154,19)`
- [ ] `Content.Client\Cargo\BUI\CargoOrderConsoleBoundUserInterface.cs(155,24)`
- [ ] `Content.Client\ContextMenu\UI\ContextMenuElement.xaml.cs(61,22)`
- [ ] `Content.Client\ContextMenu\UI\ContextMenuUIController.cs(89,13)`
- [ ] `Content.Client\ContextMenu\UI\EntityMenuUIController.cs(315,13)`
- [ ] `Content.Client\ContextMenu\UI\EntityMenuUIController.cs(343,17)`
- [ ] `Content.Client\ContextMenu\UI\EntityMenuUIController.cs(355,17)`
- [ ] `Content.Client\Examine\ExamineSystem.cs(373,17)`
- [ ] `Content.Client\Examine\ExamineSystem.cs(439,17)`
- [ ] `Content.Client\Gameplay\GameplayState.cs(86,13)`
- [ ] `Content.Client\Instruments\UI\InstrumentBoundUserInterface.cs(72,23)`
- [ ] `Content.Client\Instruments\UI\InstrumentBoundUserInterface.cs(73,27)`
- [ ] `Content.Client\Launcher\LauncherConnecting.cs(78,22)`
- [ ] `Content.Client\Lobby\LobbyUIController.cs(141,24)`
- [ ] `Content.Client\Lobby\LobbyUIController.cs(142,25)`
- [ ] `Content.Client\MainMenu\MainMenu.cs(61,13)`
- [ ] `Content.Client\Lobby\UI\HumanoidProfileEditor.FlavorText.cs(47,13)`
- [ ] `Content.Client\Weapons\Ranged\Systems\GunSystem.AmmoCounter.cs(32,26)`
- [ ] `Content.Client\Xenoarchaeology\Ui\NodeScannerBoundUserInterface.cs(30,25)`
- [ ] `Content.Client\VendingMachines\VendingMachineBoundUserInterface.cs(81,13)`
- [ ] `Content.Client\Wires\UI\WiresBoundUserInterface.cs(40,19)`
- [ ] `Content.Client\SurveillanceCamera\UI\SurveillanceCameraSetupBoundUi.cs(68,21)`
- [ ] `Content.Client\Xenoarchaeology\Ui\AnalysisConsoleBoundUserInterface.cs(55,22)`
- [ ] `Content.Client\SurveillanceCamera\UI\SurveillanceCameraMonitorBoundUi.cs(128,21)`
- [ ] `Content.Client\Replay\UI\Loading\LoadingScreen.cs(41,9)`
- [ ] `Content.Client\UserInterface\Systems\Storage\Controls\ItemGridPiece.cs(104,13)`
- [ ] `Content.Client\Shuttles\BUI\ShuttleConsoleBoundUserInterface.cs(72,21)`
- [ ] `Content.Client\Weapons\Melee\UI\MeleeSpeechBoundUserInterface.cs(51,17)`
- [ ] `Content.Client\Silicons\StationAi\StationAiCustomizationBoundUserInterface.cs(38,15)`
- [ ] `Content.Client\UserInterface\Controls\FancyTree\FancyTree.xaml.cs(236,13)`
- [ ] `Content.Client\UserInterface\Systems\Inventory\InventoryUIController.cs(82,13)`
- [ ] `Content.Client\UserInterface\Systems\Guidebook\GuidebookUIController.cs(88,9)`
- [ ] `Content.Client\UserInterface\Systems\Ghost\Widgets\GhostGui.xaml.cs(64,13)`
- [ ] `Content.Client\UserInterface\Systems\Emotes\EmotesUIController.cs(131,9)`
- [ ] `Content.Client\UserInterface\Systems\DecalPlacer\DecalPlacerUIController.cs(38,9)`
- [ ] `Content.Client\UserInterface\Systems\EscapeMenu\EscapeUIController.cs(127,13)`
- [ ] `Content.Client\UserInterface\Systems\Bwoink\AHelpUIController.cs(587,17)`
- [ ] `Content.Client\UserInterface\Systems\Info\InfoUIController.cs(57,9)`
- [ ] `Content.Client\UserInterface\Systems\Bwoink\AHelpUIController.cs(384,25)`
- [ ] `Content.Client\UserInterface\Systems\Alerts\Widgets\AlertsUI.xaml.cs(46,13)`
- [ ] `Content.Client\Shuttles\UI\ShuttleDockControl.xaml.cs(345,13)`
- [ ] `Content.Client\Shuttles\UI\ShuttleDockControl.xaml.cs(350,13)`
- [ ] `Content.Client\UserInterface\Systems\Admin\AdminUIController.cs(83,13)`
- [ ] `Content.Client\UserInterface\Systems\Bwoink\AHelpUIController.cs(485,16)`
- [ ] `Content.Client\UserInterface\Systems\Bwoink\AHelpUIController.cs(226,9)`
- [ ] `Content.Client\UserInterface\Systems\Chat\ChatUIController.cs(502,9)`
- [ ] `Content.Client\UserInterface\Controls\ListContainer.cs(121,13)`
- [ ] `Content.Client\UserInterface\Systems\Actions\ActionUIController.cs(376,13)`
- [ ] `Content.Client\UserInterface\Controls\ListContainer.cs(310,17)`
- [ ] `Content.Client\UserInterface\Systems\Actions\ActionUIController.cs(655,13)`

## [CS0618] Control.Dispose(bool) — 29x

> Controls should only be removed from UI tree instead of being disposed

**Fix hint:** Replace `control.Dispose()` with `control.Orphan()` (or `parent.RemoveChild(c)` / `window.Close()` for windows). Replace `protected override void Dispose(bool)` with `protected override void ExitedTree()` and move cleanup there. Add no `[Obsolete]` — fix properly.

- [ ] `Content.Client\Administration\UI\Tabs\ServerTab.xaml.cs(39,13)`
- [ ] `Content.Client\Administration\UI\Tabs\PlayerTab\PlayerTabHeader.xaml.cs(85,9)`
- [ ] `Content.Client\Administration\UI\AdminMenuWindow.xaml.cs(39,9)`
- [ ] `Content.Client\Administration\UI\BanList\RoleBans\RoleBanListLine.xaml.cs(34,9)`
- [ ] `Content.Client\Administration\UI\BanList\Bans\BanListLine.xaml.cs(33,9)`
- [ ] `Content.Client\Administration\UI\Bwoink\BwoinkPanel.xaml.cs(111,13)`
- [ ] `Content.Client\Administration\UI\Tabs\PlayerTab\PlayerTab.xaml.cs(105,9)`
- [ ] `Content.Client\Administration\UI\Notes\NoteEdit.xaml.cs(327,9)`
- [ ] `Content.Client\Administration\UI\Notes\AdminNotesControl.xaml.cs(213,9)`
- [ ] `Content.Client\Administration\UI\Logs\AdminLogsControl.xaml.cs(520,9)`
- [ ] `Content.Client\Administration\UI\Tabs\ObjectsTab\ObjectsTabHeader.xaml.cs(71,13)`
- [ ] `Content.Client\Administration\UI\CustomControls\AdminLogLabel.cs(29,9)`
- [ ] `Content.Client\Administration\UI\Notes\AdminNotesLinePopup.xaml.cs(100,9)`
- [ ] `Content.Client\Administration\UI\Notes\AdminNotesLine.xaml.cs(202,9)`
- [ ] `Content.Client\ContextMenu\UI\ContextMenuElement.xaml.cs(60,13)`
- [ ] `Content.Client\ContextMenu\UI\ContextMenuPopup.xaml.cs(77,13)`
- [ ] `Content.Client\ContextMenu\UI\EntityMenuElement.cs(46,13)`
- [ ] `Content.Client\Guidebook\Controls\GuideEntityEmbed.xaml.cs(132,9)`
- [ ] `Content.Client\Info\PlaytimeStats\PlaytimeStatsHeader.cs(78,9)`
- [ ] `Content.Client\LateJoin\LateJoinGui.cs(329,13)`
- [ ] `Content.Client\Lobby\UI\Loadouts\LoadoutContainer.xaml.cs(62,9)`
- [ ] `Content.Client\MassMedia\Ui\NewsWriterMenu.xaml.cs(92,9)`
- [ ] `Content.Client\MassMedia\Ui\ArticleEditorPanel.xaml.cs(124,9)`
- [ ] `Content.Client\VendingMachines\UI\VendingMachineMenu.xaml.cs(49,13)`
- [ ] `Content.Client\UserInterface\Systems\Ghost\Widgets\GhostGui.xaml.cs(60,9)`
- [ ] `Content.Client\UserInterface\Systems\Chat\Widgets\ChatBox.xaml.cs(207,9)`
- [ ] `Content.Client\UserInterface\Systems\Alerts\Controls\AlertControl.cs(151,13)`
- [ ] `Content.Client\UserInterface\Systems\Chat\Controls\ChannelSelectorPopup.cs(118,9)`
- [ ] `Content.Client\UserInterface\Systems\Chat\Controls\ChannelFilterButton.cs(83,9)`

## [CS0618] StyleNano — 22x

> Please use the new sheetlet system to define styles, and remove all references to this class as it may be deleted in the future

**Fix hint:** Replace `StyleNano` usages with new sheetlet/style system (`Stylesheet`, `StyleBox`, `SheetSystem`). See upstream sheetlet migration PRs. UI-only, medium task.

- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(99,77)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(103,74)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(107,74)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(119,37)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(158,35)`
- [ ] `Content.Client\Atmos\Consoles\AtmosMonitoringEntryContainer.xaml.cs(165,38)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(138,45)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(178,35)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(184,38)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(194,24)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(196,24)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(198,24)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlarmEntryContainer.xaml.cs(201,16)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlertsComputerWindow.xaml.cs(52,36)`
- [ ] `Content.Client\Atmos\Consoles\AtmosAlertsComputerWindow.xaml.cs(53,38)`
- [ ] `Content.Client\Crayon\UI\CrayonWindow.xaml.cs(115,51)`
- [ ] `Content.Client\Construction\UI\ConstructionMenuPresenter.cs(232,74)`
- [ ] `Content.Client\Construction\UI\ConstructionMenuPresenter.cs(315,40)`
- [ ] `Content.Client\Stylesheets\StylesheetManager.cs(52,29)`
- [ ] `Content.Client\SprayPainter\UI\SprayPainterDecals.xaml.cs(94,43)`
- [ ] `Content.Client\Power\Battery\BatteryMenu.xaml.cs(32,9)`
- [ ] `Content.Client\Power\Battery\BatteryMenu.xaml.cs(35,9)`

## [CS0618] DamageGroupPrototype — 8x

> Do not rely on DamageGroupPrototype for anything besides grouping logically similar damage in UIs

**Fix hint:** DO NOT mass-fix now. `DamageGroupPrototype` stays valid only for UI grouping. Code relying on it for logic needs redesign alongside damage-model refactor.

- [ ] `Content.Client\Damage\DamageVisualsComponent.cs(60,67)`
- [ ] `Content.Client\Damage\DamageVisualsComponent.cs(89,48)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(159,28)`
- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(516,51)`
- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(192,79)`
- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(527,45)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(171,51)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(186,43)`

## [CS0618] ResolvedSoundSpecifier.implicit operator ResolvedSoundSpecifier(string) — 6x

> String literals for sounds are deprecated, use a SoundSpecifier or ResolvedSoundSpecifier as appropriate instead

**Fix hint:** Replace string literal sounds with `SoundSpecifier` / `SoundPathSpecifier` / `SoundCollectionSpecifier` (e.g. `new SoundPathSpecifier("/Audio/...")`), or `ResolvedSoundSpecifier` where already resolved.

- [ ] `Content.Client\Audio\Jukebox\JukeboxMenu.xaml.cs(133,122)`
- [ ] `Content.Client\Audio\Jukebox\JukeboxBoundUserInterface.cs(63,70)`
- [ ] `Content.Client\Audio\ContentAudioSystem.AmbientMusic.cs(209,13)`
- [ ] `Content.Client\Audio\ContentAudioSystem.LobbyMusic.cs(182,13)`
- [ ] `Content.Client\UserInterface\Systems\Chat\Widgets\ChatBox.xaml.cs(65,58)`
- [ ] `Content.Client\UserInterface\Systems\Bwoink\AHelpUIController.cs(143,35)`

## [CS0618] DamageableSystem.GetTotalDamage(Entity<DamageableComponent?>) — 4x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(493,37)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(107,28)`
- [ ] `Content.Client\Overlays\EntityHealthBarOverlay.cs(140,27)`
- [ ] `Content.Client\UserInterface\Systems\DamageOverlays\DamageOverlayUiController.cs(136,46)`

## [CS0618] Logger.Warning(string) — 4x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Client\Guidebook\Richtext\TextLinkTag.cs(56,13)`
- [ ] `Content.Client\Guidebook\Controls\GuidebookRichPrototypeLink.cs(64,13)`
- [ ] `Content.Client\UserInterface\Controls\SlotControl.cs(41,21)`
- [ ] `Content.Client\UserInterface\Systems\Inventory\Controls\InventoryDisplay.cs(32,13)`

## [CS0618] EntitySpawnWindow.InitOpts — 4x

> Use IPlacementManager.AllModeNames

**Fix hint:** Replace obsolete placement mode API with `IPlacementManager.AllModeNames`.

- [ ] `Content.Client\Mapping\MappingScreen.xaml.cs(92,29)`
- [ ] `Content.Client\Mapping\MappingScreen.xaml.cs(94,41)`
- [ ] `Content.Client\Mapping\MappingState.cs(562,57)`
- [ ] `Content.Client\Mapping\MappingState.cs(661,35)`

## [CS0618] RandomExtensions.NextFloat(Random) — 4x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Client\Paper\UI\StampCollection.xaml.cs(56,65)`
- [ ] `Content.Client\Parallax\ParallaxGenerator.cs(419,32)`
- [ ] `Content.Client\Parallax\ParallaxGenerator.cs(464,40)`
- [ ] `Content.Client\Parallax\ParallaxGenerator.cs(475,32)`

## [CS0618] DamageableSystem.GetDamagePerGroup(Entity<DamageableComponent?>) — 3x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(389,50)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(138,13)`
- [ ] `Content.Client\UserInterface\Systems\DamageOverlays\DamageOverlayUiController.cs(97,30)`

## [CS0618] SpriteComponent.Color.set — 3x

> Use SpriteSystem.SetColor() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\WallStains\Systems\WallStainVisualsSystem.cs(24,13)`
- [ ] `Content.Client\_Funkystation\WallStains\Systems\FlammableWallFireVisualsSystem.cs(107,13)`
- [ ] `Content.Client\_Funkystation\ReagentFires\Systems\ReagentPuddleFireVisualsSystem.cs(125,17)`

## [CS0618] SpriteComponent.LayerSetState(int, RSI.StateId) — 3x

> Use SpriteSystem.LayerSetRsiState() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\WallStains\Systems\WallStainVisualsSystem.cs(29,13)`
- [ ] `Content.Client\_Funkystation\WallStains\Systems\FlammableWallFireVisualsSystem.cs(106,13)`
- [ ] `Content.Client\_Funkystation\ReagentFires\Systems\ReagentPuddleFireVisualsSystem.cs(98,13)`

## [CS0618] StatusEffectsSystem — 2x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Client\Flash\FlashOverlay.cs(25,26)`
- [ ] `Content.Client\Flash\FlashOverlay.cs(38,48)`

## [CS0618] Logger.Error(string) — 2x

> Use ISawmill.Error

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Client\Administration\UI\CustomControls\CommandButton.cs(44,17)`
- [ ] `Content.Client\Guidebook\Richtext\Table.cs(18,13)`

## [CS0618] DamageableSystem.GetAllDamage(Entity<DamageableComponent?>) — 2x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Client\Damage\DamageVisualsSystem.cs(520,22)`
- [ ] `Content.Client\HealthAnalyzer\UI\HealthAnalyzerControl.xaml.cs(142,29)`

## [CS0618] Component.Owner — 2x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites.

- [ ] `Content.Client\Light\AmbientOcclusionOverlay.cs(120,64)`
- [ ] `Content.Client\Light\AmbientOcclusionOverlay.cs(122,57)`

## [CS0618] FontPrototype.Path — 2x

> Font prototype is a bad API.

**Fix hint:** Remove font-prototype based rich-text handling; use engine fonts.

- [ ] `Content.Client\MapText\MapTextSystem.cs(74,96)`
- [ ] `Content.Client\MapText\MapTextSystem.cs(78,69)`

## [CS0672] (no member) — 1x

> Member 'GuideEntityEmbed.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'GuideEntityEmbed.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Guidebook\Controls\GuideEntityEmbed.xaml.cs(130,29)`

## [CS0672] (no member) — 1x

> Member 'AdminMenuWindow.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminMenuWindow.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\AdminMenuWindow.xaml.cs(36,29)`

## [CS0672] (no member) — 1x

> Member 'LateJoinGui.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'LateJoinGui.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\LateJoin\LateJoinGui.cs(327,33)`

## [CS0672] (no member) — 1x

> Member 'BanListLine.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'BanListLine.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\BanList\Bans\BanListLine.xaml.cs(31,29)`

## [CS0672] (no member) — 1x

> Member 'BwoinkPanel.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'BwoinkPanel.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Bwoink\BwoinkPanel.xaml.cs(109,33)`

## [CS0672] (no member) — 1x

> Member 'AdminLogLabel.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminLogLabel.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\CustomControls\AdminLogLabel.cs(27,29)`

## [CS0672] (no member) — 1x

> Member 'RoleBanListLine.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'RoleBanListLine.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\BanList\RoleBans\RoleBanListLine.xaml.cs(32,29)`

## [CS0672] (no member) — 1x

> Member 'AdminLogsControl.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminLogsControl.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Logs\AdminLogsControl.xaml.cs(518,29)`

## [CS0672] (no member) — 1x

> Member 'AdminNotesControl.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminNotesControl.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Notes\AdminNotesControl.xaml.cs(211,29)`

## [CS0672] (no member) — 1x

> Member 'AdminNotesLine.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminNotesLine.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Notes\AdminNotesLine.xaml.cs(200,29)`

## [CS0672] (no member) — 1x

> Member 'AdminNotesLinePopup.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AdminNotesLinePopup.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Notes\AdminNotesLinePopup.xaml.cs(98,29)`

## [CS0672] (no member) — 1x

> Member 'NoteEdit.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'NoteEdit.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Notes\NoteEdit.xaml.cs(325,29)`

## [CS0672] (no member) — 1x

> Member 'ArticleEditorPanel.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ArticleEditorPanel.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\MassMedia\Ui\ArticleEditorPanel.xaml.cs(122,29)`

## [CS0672] (no member) — 1x

> Member 'ObjectsTabHeader.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ObjectsTabHeader.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Tabs\ObjectsTab\ObjectsTabHeader.xaml.cs(69,33)`

## [CS0672] (no member) — 1x

> Member 'NewsWriterMenu.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'NewsWriterMenu.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\MassMedia\Ui\NewsWriterMenu.xaml.cs(90,29)`

## [CS0672] (no member) — 1x

> Member 'PlayerTab.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'PlayerTab.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Tabs\PlayerTab\PlayerTab.xaml.cs(103,29)`

## [CS0672] (no member) — 1x

> Member 'PlayerTabHeader.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'PlayerTabHeader.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Tabs\PlayerTab\PlayerTabHeader.xaml.cs(83,29)`

## [CS0672] (no member) — 1x

> Member 'ServerTab.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ServerTab.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Administration\UI\Tabs\ServerTab.xaml.cs(37,33)`

## [CS0672] (no member) — 1x

> Member 'VendingMachineMenu.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'VendingMachineMenu.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\VendingMachines\UI\VendingMachineMenu.xaml.cs(47,33)`

## [CS0672] (no member) — 1x

> Member 'PlaytimeStatsHeader.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'PlaytimeStatsHeader.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Info\PlaytimeStats\PlaytimeStatsHeader.cs(76,29)`

## [CS0672] (no member) — 1x

> Member 'ContextMenuElement.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ContextMenuElement.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\ContextMenu\UI\ContextMenuElement.xaml.cs(58,33)`

## [CS0672] (no member) — 1x

> Member 'ContextMenuPopup.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ContextMenuPopup.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\ContextMenu\UI\ContextMenuPopup.xaml.cs(73,33)`

## [CS0672] (no member) — 1x

> Member 'EntityMenuElement.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'EntityMenuElement.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\ContextMenu\UI\EntityMenuElement.cs(44,33)`

## [CS0618] DamageChangedEvent — 1x

> Will be replaced with damage-model specific events; general 

**Fix hint:** DO NOT mass-fix now. `DamageChangedEvent` -> subscribe to `DamageDealtEvent` / damage-model specific events per upstream EE/WizDen migration. Large refactor, track upstream first.

- [ ] `Content.Client\_ES\PainFlash\ESPainFlashSystem.cs(86,83)`

## [CS0672] (no member) — 1x

> Member 'AlertControl.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'AlertControl.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\UserInterface\Systems\Alerts\Controls\AlertControl.cs(149,33)`

## [CS0672] (no member) — 1x

> Member 'LoadoutContainer.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'LoadoutContainer.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\Lobby\UI\Loadouts\LoadoutContainer.xaml.cs(60,29)`

## [CS0672] (no member) — 1x

> Member 'ChannelFilterButton.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ChannelFilterButton.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\UserInterface\Systems\Chat\Controls\ChannelFilterButton.cs(81,29)`

## [CS0672] (no member) — 1x

> Member 'GhostGui.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'GhostGui.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\UserInterface\Systems\Ghost\Widgets\GhostGui.xaml.cs(58,29)`

## [CS0672] (no member) — 1x

> Member 'ChatBox.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ChatBox.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\UserInterface\Systems\Chat\Widgets\ChatBox.xaml.cs(205,29)`

## [CS0672] (no member) — 1x

> Member 'ChannelSelectorPopup.Dispose(bool)' overrides obsolete member 'Control.Dispose(bool)'. Add the Obsolete attribute to 'ChannelSelectorPopup.Dispose(bool)'. [G:\Servers\ss14\Starfall-Drift\Content.Client\Content.Client.csproj]

**Fix hint:** Do NOT just add [Obsolete]. Convert `Dispose(bool)` override to `ExitedTree()` override (see above). CS0672 disappears once the base is no longer overridden.

- [ ] `Content.Client\UserInterface\Systems\Chat\Controls\ChannelSelectorPopup.cs(116,29)`

## [CS0618] FormattedMessage.FromMarkup(string) — 1x

> Use FromMarkupOrThrow or TryFromMarkup

**Fix hint:** Replace `FormattedMessage.FromMarkup(string)` with `FromMarkupOrThrow` or `TryFromMarkup`.

- [ ] `Content.Client\Administration\UI\AdminRemarks\AdminMessagePopupWindow.xaml.cs(55,13)`

## [CS0618] Logger.WarningS(string, string) — 1x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Client\Administration\UI\Notes\AdminNotesLine.xaml.cs(64,13)`

## [CS0618] SpriteComponent.CopyFrom(SpriteComponent) — 1x

> Use SpriteSystem.CopySprite() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\Clothing\Systems\ChameleonClothingSystem.cs(40,13)`

## [CS0618] SpriteComponent.GetPrototypeTextures(EntityPrototype, IResourceCache) — 1x

> Use SpriteSystem.GetPrototypeTextures() instead

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\Construction\ConstructionPlacementHijack.cs(60,39)`

## [CS0618] StatusEffectsSystem.TryGetTime(EntityUid, string, out (TimeSpan, TimeSpan)?, StatusEffectsComponent?) — 1x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Client\Flash\FlashOverlay.cs(54,18)`

## [CS0618] Loc.TryGetString(string, out string?) — 1x

> Use ILocalizationManager

**Fix hint:** Replace static `Loc.TryGetString` with injected `ILocalizationManager`.

- [ ] `Content.Client\Humanoid\OrganMarkingPicker.xaml.cs(82,17)`

## [CS0612] IMapManager.FindGridsIntersecting(MapId, Box2Rotated, bool, bool) — 1x

**Fix hint:** Replace obsolete `IMapManager.FindGridsIntersecting` with `MapSystem` equivalent.

- [ ] `Content.Client\Light\AmbientOcclusionOverlay.cs(118,38)`

## [CS0618] SpriteComponent.LayerExists(int, bool) — 1x

> Use SpriteSystem.LayerExists() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(40,18)`

## [CS0618] SpriteComponent.AddBlankLayer(int?) — 1x

> Use SpriteSystem.AddBlankLayer() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(41,17)`

## [CS0618] SpriteComponent.LayerSetOffset(int, Vector2) — 1x

> Use SpriteSystem.LayerSetOffset() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(43,13)`

## [CS0618] SpriteComponent.LayerSetRotation(int, Angle) — 1x

> Use SpriteSystem.LayerSetRotation() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(44,13)`

## [CS0618] SpriteComponent.LayerSetColor(int, Color) — 1x

> Use SpriteSystem.LayerSetColor() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(45,13)`

## [CS0618] SpriteComponent.LayerSetSprite(int, SpriteSpecifier) — 1x

> Use SpriteSystem.LayerSetSprite() instead.

**Fix hint:** Replace direct `SpriteComponent` setters (`Color`, `Offset`, `Rotation`, `Scale`, `LayerSet*`, `CopyFrom`, `Render`, `ContainerOccluded`) with `SpriteSystem.*` methods (`SetColor`, `SetOffset`, `SetRotation`, `SetScale`, `LayerSetRsiState`, `CopySprite`, `Render`, ...). Requires `SpriteSystem` resolve/inject.

- [ ] `Content.Client\_Funkystation\Footprints\FootprintSystem.cs(46,13)`

## [CS0618] StylesheetManager.SheetNano — 1x

> Update to use SheetNanotrasen instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Client\Stylesheets\StylesheetManager.cs(52,13)`

## [CS0618] StylesheetManager.SheetSpace — 1x

> Update to use SheetSystem instead

**Fix hint:** Migrate to `SheetSystem` per new UI styling.

- [ ] `Content.Client\Stylesheets\StylesheetManager.cs(53,13)`

## [CS0618] StyleSpace — 1x

> Please use the new sheetlet system to define styles, and remove all references to this class as it may be deleted in the future

**Fix hint:** Replace `StyleNano` usages with new sheetlet/style system (`Stylesheet`, `StyleBox`, `SheetSystem`). See upstream sheetlet migration PRs. UI-only, medium task.

- [ ] `Content.Client\Stylesheets\StylesheetManager.cs(53,30)`

## [CS0618] EntitySystem.Get<T>() — 1x

> Either use a dependency, resolve and cache IEntityManager manually, or use EntityManager.System<T>()

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Client\RCD\Systems\RPDSystem.cs(41,26)`

## [CS0618] IStylesheetManager.SheetSpace — 1x

> Update to use SheetSystem instead

**Fix hint:** Migrate to `SheetSystem` per new UI styling.

- [ ] `Content.Client\Replay\UI\Loading\ReplayLoadingFailedControl.xaml.cs(17,22)`

## [CS0618] FontTag.CreateFont(Stack<Font>, MarkupNode, IResourceCache, IPrototypeManager, string) — 1x

> Stop using font prototypes

**Fix hint:** Remove `FontTag.CreateFont` prototype usage; use engine font resources directly.

- [ ] `Content.Client\UserInterface\RichText\MonoTag.cs(25,20)`

## [CS0618] Logger.WarningS(string, string, params object?[]) — 1x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Client\UserInterface\Systems\Alerts\Widgets\AlertsUI.xaml.cs(81,17)`

## [CS0618] Logger.ErrorS(string, string, params object?[]) — 1x

> Use ISawmill.Error

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Client\UserInterface\Systems\Alerts\Widgets\AlertsUI.xaml.cs(89,17)`
