# Content.Server — warnings to fix (fork code, safe to edit)

_Source: `Scripts/logs/Content.Tests.log`. Fork-owned code — fix here. Checkboxes track progress._

Total in this file: **210**

## [CS0618] DamageChangedEvent — 39x

> Will be replaced with damage-model specific events; general 

**Fix hint:** DO NOT mass-fix now. `DamageChangedEvent` -> subscribe to `DamageDealtEvent` / damage-model specific events per upstream EE/WizDen migration. Large refactor, track upstream first.

- [ ] `Content.Server\Access\Systems\IdCardConsoleSystem.cs(250,77)`
- [ ] `Content.Server\Damage\ForceSay\DamageForceSaySystem.cs(104,84)`
- [ ] `Content.Server\Damage\Systems\DamageRandomPopupSystem.cs(24,86)`
- [ ] `Content.Server\BloodCult\EntitySystems\SoulStoneSystem.cs(97,79)`
- [ ] `Content.Server\Explosion\EntitySystems\ExplosionSystem.Airtight.cs(192,79)`
- [ ] `Content.Server\KillTracking\KillTrackingSystem.cs(24,81)`
- [ ] `Content.Server\Mech\Systems\MechSystem.cs(260,74)`
- [ ] `Content.Server\CardboardBox\CardboardBoxSystem.cs(106,75)`
- [ ] `Content.Server\Destructible\DestructibleSystem.cs(75,76)`
- [ ] `Content.Server\Guardian\GuardianSystem.cs(283,84)`
- [ ] `Content.Server\Revenant\EntitySystems\RevenantSystem.cs(111,71)`
- [ ] `Content.Server\Silicons\StationAi\StationAiSystem.cs(237,77)`
- [ ] `Content.Server\_ES\PainFlash\ESPainFlashSystem.cs(10,83)`
- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\NuclearReactorSystem.cs(931,77)`
- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\TurbineSystem.cs(485,70)`
- [ ] `Content.Server\VendingMachines\VendingMachineSystem.cs(74,88)`
- [ ] `Content.Server\Chat\Systems\EmoteOnDamageSystem.cs(27,80)`
- [ ] `Content.Server\Spreader\KudzuSystem.cs(33,75)`
- [ ] `Content.Server\Atmos\EntitySystems\FlammableSystem.cs(351,92)`
- [ ] `Content.Server\NPC\Systems\NPCRetaliationSystem.cs(28,75)`
- [ ] `Content.Server\Access\Systems\IdCardConsoleSystem.cs(55,53)`
- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\TurbineSystem.cs(67,47)`
- [ ] `Content.Server\VendingMachines\VendingMachineSystem.cs(32,58)`
- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\NuclearReactorSystem.cs(83,54)`
- [ ] `Content.Server\Spreader\KudzuSystem.cs(30,45)`
- [ ] `Content.Server\Silicons\StationAi\StationAiSystem.cs(86,53)`
- [ ] `Content.Server\Revenant\EntitySystems\RevenantSystem.cs(53,48)`
- [ ] `Content.Server\Mech\Systems\MechSystem.cs(63,44)`
- [ ] `Content.Server\KillTracking\KillTrackingSystem.cs(20,51)`
- [ ] `Content.Server\Guardian\GuardianSystem.cs(48,52)`
- [ ] `Content.Server\Damage\Systems\DamageRandomPopupSystem.cs(21,57)`
- [ ] `Content.Server\Explosion\EntitySystems\ExplosionSystem.cs(103,48)`
- [ ] `Content.Server\CardboardBox\CardboardBoxSystem.cs(38,52)`
- [ ] `Content.Server\Chat\Systems\EmoteOnDamageSystem.cs(24,53)`
- [ ] `Content.Server\BloodCult\EntitySystems\SoulStoneSystem.cs(69,43)`
- [ ] `Content.Server\NPC\Systems\NPCRetaliationSystem.cs(24,54)`
- [ ] `Content.Server\Destructible\DestructibleSystem.cs(59,52)`
- [ ] `Content.Server\Damage\ForceSay\DamageForceSaySystem.cs(35,54)`
- [ ] `Content.Server\Atmos\EntitySystems\FlammableSystem.cs(81,62)`

## [CS0618] Component.Owner — 28x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites.

- [ ] `Content.Server\_Funkystation\Atmos\Reactions\PluoxiumRadiationProductionReaction.cs(157,23)`
- [ ] `Content.Server\Power\NodeGroups\PowerNet.cs(54,77)`
- [ ] `Content.Server\Power\NodeGroups\PowerNet.cs(67,40)`
- [ ] `Content.Server\Power\NodeGroups\PowerNet.cs(83,77)`
- [ ] `Content.Server\Power\NodeGroups\PowerNet.cs(96,40)`
- [ ] `Content.Server\Instruments\InstrumentComponent.cs(20,60)`
- [ ] `Content.Server\Instruments\InstrumentComponent.cs(21,55)`
- [ ] `Content.Server\DeviceNetwork\Systems\DeviceNetworkSystem.cs(349,21)`
- [ ] `Content.Server\DeviceNetwork\Systems\DeviceNetworkSystem.cs(353,33)`
- [ ] `Content.Server\DeviceNetwork\Systems\DeviceNetworkSystem.cs(356,37)`
- [ ] `Content.Server\DeviceNetwork\Systems\DeviceListSystem.cs(99,44)`
- [ ] `Content.Server\DeviceNetwork\Systems\ApcNetworkSystem.cs(42,26)`
- [ ] `Content.Server\Atmos\Piping\Components\AtmosPipeColorComponent.cs(16,93)`
- [ ] `Content.Server\Power\EntitySystems\PowerReceiverSystem.cs(77,31)`
- [ ] `Content.Server\Power\EntitySystems\PowerMonitoringConsoleSystem.cs(531,23)`
- [ ] `Content.Server\Power\EntitySystems\PowerMonitoringConsoleSystem.cs(558,23)`
- [ ] `Content.Server\Power\EntitySystems\PowerMonitoringConsoleSystem.cs(596,23)`
- [ ] `Content.Server\Power\EntitySystems\PowerNetSystem.cs(488,73)`
- [ ] `Content.Server\Power\EntitySystems\PowerMonitoringConsoleSystem.cs(645,23)`
- [ ] `Content.Server\Power\EntitySystems\PowerMonitoringConsoleSystem.cs(672,23)`
- [ ] `Content.Server\Power\EntitySystems\PowerNetSystem.cs(507,70)`
- [ ] `Content.Server\Power\EntitySystems\PowerNetSystem.cs(514,70)`
- [ ] `Content.Server\Power\Components\PowerMonitoringDeviceComponent.cs(62,51)`
- [ ] `Content.Server\Power\Components\CableComponent.cs(45,32)`
- [ ] `Content.Server\Power\Components\BaseNetConnectorComponent.cs(62,41)`
- [ ] `Content.Server\Power\Components\ApcComponent.cs(67,23)`
- [ ] `Content.Server\Power\Components\ApcComponent.cs(72,26)`
- [ ] `Content.Server\Atmos\EntitySystems\AtmosphereSystem.Hotspot.cs(207,25)`

## [CS0618] DamageableSystem.GetTotalDamage(Entity<DamageableComponent?>) — 18x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Server\Spreader\KudzuSystem.cs(37,35)`
- [ ] `Content.Server\Spreader\KudzuSystem.cs(122,35)`
- [ ] `Content.Server\Silicons\StationAi\StationAiSystem.cs(256,42)`
- [ ] `Content.Server\Silicons\StationAi\StationAiSystem.cs(303,29)`
- [ ] `Content.Server\Projectiles\ProjectileSystem.cs(56,31)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(235,39)`
- [ ] `Content.Server\NPC\Systems\NPCUtilitySystem.cs(314,35)`
- [ ] `Content.Server\Mech\Systems\MechSystem.cs(262,50)`
- [ ] `Content.Server\Medical\CryoPodSystem.cs(61,51)`
- [ ] `Content.Server\Damage\Systems\ExaminableDamageSystem.cs(44,22)`
- [ ] `Content.Server\Explosion\EntitySystems\ExplosionSystem.Airtight.cs(295,58)`
- [ ] `Content.Server\Mining\MeteorSystem.cs(50,30)`
- [ ] `Content.Server\Mining\MeteorSystem.cs(55,64)`
- [ ] `Content.Server\Ghost\GhostSystem.cs(578,39)`
- [ ] `Content.Server\Speech\EntitySystems\DamagedSiliconAccentSystem.cs(57,26)`
- [ ] `Content.Server\Silicons\Borgs\BorgSystem.Transponder.cs(182,35)`
- [ ] `Content.Server\BloodCult\EntitySystems\JuggernautBloodAbsorptionSystem.cs(69,31)`
- [ ] `Content.Server\NPC\HTN\PrimitiveTasks\Operators\Specific\PickNearbyInjectableOperator.cs(86,60)`

## [CS0618] StatusEffectsSystem — 12x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Server\Electrocution\ElectrocuteCommand.cs(13,26)`
- [ ] `Content.Server\Electrocution\ElectrocutionSystem.cs(49,26)`
- [ ] `Content.Server\Revenant\EntitySystems\RevenantSystem.cs(39,26)`
- [ ] `Content.Server\Speech\EntitySystems\RatvarianLanguageSystem.cs(13,26)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Revenant.EntitySystems.RevenantSystem.g.cs(40,28)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Revenant.EntitySystems.RevenantSystem.g.cs(83,27)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Speech.EntitySystems.RatvarianLanguageSystem.g.cs(15,27)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Speech.EntitySystems.RatvarianLanguageSystem.g.cs(26,27)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Electrocution.ElectrocutionSystem.g.cs(25,28)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Electrocution.ElectrocutionSystem.g.cs(53,27)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Electrocution.ElectrocuteCommand.g.cs(16,27)`
- [ ] `Content.Server\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Server.Electrocution.ElectrocuteCommand.g.cs(28,27)`

## [CS0618] ResolvedSoundSpecifier.implicit operator ResolvedSoundSpecifier(string) — 11x

> String literals for sounds are deprecated, use a SoundSpecifier or ResolvedSoundSpecifier as appropriate instead

**Fix hint:** Replace string literal sounds with `SoundSpecifier` / `SoundPathSpecifier` / `SoundCollectionSpecifier` (e.g. `new SoundPathSpecifier("/Audio/...")`), or `ResolvedSoundSpecifier` where already resolved.

- [ ] `Content.Server\RoundEnd\RoundEndSystem.cs(214,31)`
- [ ] `Content.Server\RoundEnd\RoundEndSystem.cs(264,31)`
- [ ] `Content.Server\Nuke\NukeSystem.cs(53,56)`
- [ ] `Content.Server\ParticleAccelerator\EntitySystems\ParticleAcceleratorSystem.ControlBox.cs(190,39)`
- [ ] `Content.Server\Administration\Systems\AdminSystem.cs(403,35)`
- [ ] `Content.Server\Fax\FaxSystem.cs(655,33)`
- [ ] `Content.Server\Medical\BiomassReclaimer\BiomassReclaimerSystem.cs(132,40)`
- [ ] `Content.Server\Dragon\DragonRiftSystem.cs(84,35)`
- [ ] `Content.Server\Shuttles\Systems\EmergencyShuttleSystem.Console.cs(300,31)`
- [ ] `Content.Server\Shuttles\Systems\EmergencyShuttleSystem.Console.cs(404,27)`
- [ ] `Content.Server\Administration\Commands\PlayGlobalSoundCommand.cs(91,79)`

## [CS0612] AntagSelectionSystem.ForceMakeAntag<T>(ICommonSession, EntProtoId) — 9x

**Fix hint:** Migrate off obsolete `ForceMakeAntag<T>(ICommonSession, EntProtoId)` overload to current `AntagSelectionSystem` API (check signature in Content.Server).

- [ ] `Content.Server\Traitor\Systems\AutoTraitorSystem.cs(29,9)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(62,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(77,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(107,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(138,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(153,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(168,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(205,17)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Antags.cs(220,17)`

## [CS0618] StorageFillComponent — 6x

> Use ContainerFillComponent or EntityTableContainerFillComponent instead

**Fix hint:** Replace obsolete container-fill prototype usage with `ContainerFillComponent` or `EntityTableContainerFillComponent`. Data-file + code change.

- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.Fill.cs(15,54)`
- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.Fill.cs(34,37)`
- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.Fill.cs(34,37)`
- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.Fill.cs(89,43)`
- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.Fill.cs(89,43)`
- [ ] `Content.Server\Storage\EntitySystems\StorageSystem.cs(19,29)`

## [CS0618] SharedSolutionContainerSystem.EnsureSolution(Entity<SolutionManagerComponent?>, string, out Entity<SolutionComponent>) — 5x

> Solution string matching will be removed in the future in favor of relations and enumerators.

**Fix hint:** Migrate `EnsureSolution(Entity, string, ...)` to relation/enumerator-based solution API. See `SharedSolutionContainerSystem` new overloads. Per-system migration.

- [ ] `Content.Server\_Funkystation\Footprints\FootprintSystem.cs(148,9)`
- [ ] `Content.Server\_Funkystation\Footprints\FootprintSystem.cs(176,9)`
- [ ] `Content.Server\Chemistry\EntitySystems\SolutionRandomFillSystem.cs(41,9)`
- [ ] `Content.Server\Botany\Systems\BotanySystem.Produce.cs(23,9)`
- [ ] `Content.Server\Chemistry\EntitySystems\ChemMasterSystem.cs(238,17)`

## [CS0618] SharedStackSystem.SetCount(EntityUid, int, StackComponent?) — 5x

> Use Entity<T> method instead

**Fix hint:** Switch to `Entity<T>` overloads, e.g. `SetCount(Entity<StackComponent>, ...)` / `SetAwake(Entity<PhysicsComponent>, ...)` / `SetLocalRotation(EntityUid, ...)` variants. Mechanical, low risk.

- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\NuclearCentrifugeSystem.cs(68,25)`
- [ ] `Content.Server\_Funkystation\Atmos\Portable\ElectrolyzerSystem.cs(145,13)`
- [ ] `Content.Server\_Funkystation\Atmos\Portable\ElectrolyzerSystem.cs(268,17)`
- [ ] `Content.Server\_Funkystation\Atmos\Portable\ElectrolyzerSystem.cs(269,17)`
- [ ] `Content.Server\_Funkystation\Atmos\Portable\ElectrolyzerSystem.cs(273,17)`

## [CS0618] BodySystem.TryGetOrgansWithComponent<TComp>(Entity<BodyComponent?>, out List<Entity<TComp>>) — 5x

> Use an event-relay based approach instead

**Fix hint:** Replace `BodySystem.TryGetOrgansWithComponent` direct queries with event-relay pattern (raise event on body, organ systems respond). Follow upstream body refactor examples.

- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(325,21)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(355,21)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(380,21)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(404,21)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(426,21)`

## [CS0618] RandomHelpers.Shuffle<T>(Random, IList<T>) — 5x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.AutoCabling.cs(52,9)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.DunGenPrefab.cs(103,13)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.DungeonEntrance.cs(31,13)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.ExternalWindow.cs(35,9)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Worm.cs(42,9)`

## [CS0618] LoadMapRuleComponent.PreloadedGrid — 5x

> Do not pre-load grids. This causes the server to have to keep that grid loaded in memory during the entire round, even if that grid is never summoned to the playspace.

**Fix hint:** Remove pre-loaded grid references; load grids on demand instead of keeping them resident. Map/sys design change.

- [ ] `Content.Server\GameTicking\Rules\LoadMapRuleSystem.cs(25,13)`
- [ ] `Content.Server\GameTicking\Rules\LoadMapRuleSystem.cs(40,35)`
- [ ] `Content.Server\GameTicking\Rules\LoadMapRuleSystem.cs(49,35)`
- [ ] `Content.Server\GameTicking\Rules\LoadMapRuleSystem.cs(64,35)`
- [ ] `Content.Server\GameTicking\Rules\LoadMapRuleSystem.cs(78,18)`

## [CS0618] DamageableSystem.GetAllDamage(Entity<DamageableComponent?>) — 4x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Server\_FarHorizons\Power\Generation\FissionGenerator\ReactorPartSystem.cs(162,20)`
- [ ] `Content.Server\Cloning\CloningPodSystem.cs(185,13)`
- [ ] `Content.Server\BloodCult\EntitySystems\JuggernautBloodAbsorptionSystem.cs(152,33)`
- [ ] `Content.Server\Atmos\EntitySystems\BarotraumaSystem.cs(214,39)`

## [CS0618] RandomExtensions.NextAngle(Random) — 4x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\StationEvents\Events\MeteorSwarmSystem.cs(69,19)`
- [ ] `Content.Server\Administration\Systems\AdminVerbSystem.Smites.cs(1084,22)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Exterior.cs(21,21)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Worm.cs(80,34)`

## [CS0618] RandomHelpers.Prob(Random, double) — 4x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.CornerClutter.cs(42,21)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.DunGenReplaceTile.cs(35,25)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.SplineDungeonConnector.cs(103,21)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.WallMount.cs(29,18)`

## [CS0618] Logger.Warning(string) — 4x

> Use ISawmill.Warning

**Fix hint:** Inject `ILogManager` (`[Dependency] private readonly ILogManager _log = default!;` then `private ISawmill _sawmill` set in constructor/Initialize via `_log.GetSawmill("name")`) and replace `Logger.Error/Warning/Debug/ErrorS/WarningS/DebugS` with `_sawmill.Error/Warning/Debug`. For static contexts use `IoCManager.Resolve<ILogManager>().GetSawmill(...)` or pass a sawmill in.

- [ ] `Content.Server\Construction\Completions\BuildMech.cs(31,13)`
- [ ] `Content.Server\Construction\Completions\BuildMech.cs(40,13)`
- [ ] `Content.Server\Construction\Completions\BuildMech.cs(46,13)`
- [ ] `Content.Server\Construction\Completions\BuildMech.cs(53,13)`

## [CS0618] DamageGroupPrototype — 3x

> Do not rely on DamageGroupPrototype for anything besides grouping logically similar damage in UIs

**Fix hint:** DO NOT mass-fix now. `DamageGroupPrototype` stays valid only for UI grouping. Code relying on it for logic needs redesign alongside damage-model refactor.

- [ ] `Content.Server\Weapons\Ranged\Components\RangedDamageSoundComponent.cs(19,93)`
- [ ] `Content.Server\Damage\Commands\HurtCommand.cs(30,68)`
- [ ] `Content.Server\Damage\Commands\HurtCommand.cs(71,44)`

## [CS0618] StatusEffectsSystem.TryAddStatusEffect<T>(EntityUid, string, TimeSpan, bool, StatusEffectsComponent?) — 3x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Server\Revenant\EntitySystems\RevenantSystem.cs(167,9)`
- [ ] `Content.Server\Speech\EntitySystems\RatvarianLanguageSystem.cs(52,9)`
- [ ] `Content.Server\Electrocution\ElectrocutionSystem.cs(391,14)`

## [CS0618] EntityCoordinates.GetGridUid(IEntityManager) — 3x

> Use SharedTransformSystem.GetGrid()

**Fix hint:** Use `SharedTransformSystem` (`ToMapCoordinates`, `GetMapId`, `GetGrid`, `AnchorEntity/Unanchor`, `SetLocalRotation(EntityUid, ...)`) instead of `EntityCoordinates`/`TransformComponent` direct APIs.

- [ ] `Content.Server\Radiation\Systems\RadiationSystem.cs(111,23)`
- [ ] `Content.Server\Fluids\EntitySystems\PuddleSystem.cs(65,23)`
- [ ] `Content.Server\Fluids\EntitySystems\PuddleSystem.cs(69,13)`

## [CS0618] RandomExtensions.NextPolarVector2(Random, float, float) — 3x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.cs(136,25)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.cs(167,37)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.cs(287,40)`

## [CS0618] DamageableSystem.CanBeDamagedBy(Entity<InjurableComponent?>, ProtoId<DamageTypePrototype>) — 3x

> Do not rely on the ability to determine if an entity will be able to be damaged by something

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Server\Explosion\EntitySystems\ExplosionSystem.Airtight.cs(254,22)`
- [ ] `Content.Server\BloodCult\EntitySystems\BloodCultRuneCarverSystem.cs(432,7)`
- [ ] `Content.Server\BloodCult\EntitySystems\BloodCultRuneCarverSystem.cs(446,12)`

## [CS0618] DamageableSystem.GetDamagePerGroup(Entity<DamageableComponent?>) — 3x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Server\BloodCult\EntitySystems\CultHealingSourceSystem.cs(350,30)`
- [ ] `Content.Server\BloodCult\EntitySystems\CultistSpellSystem.cs(128,26)`
- [ ] `Content.Server\BloodCult\EntitySystems\BloodCultistReactionSystem.cs(138,26)`

## [CS0618] TraitPrototype.Components — 2x

> Use JobSpecial instead.

**Fix hint:** Replace obsolete job prototype usage with `JobSpecial` pattern.

- [ ] `Content.Server\Traits\TraitSystem.cs(48,17)`
- [ ] `Content.Server\Traits\TraitSystem.cs(49,55)`

## [CS0618] RandomExtensions.PickAndTake<T>(Random, ICollection<T>) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Parallax\BiomeSystem.cs(641,33)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Ore.cs(97,37)`

## [CS0618] RandomExtensions.Pick<T>(Random, ICollection<T>) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.CorridorClutter.cs(23,24)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Worm.cs(103,34)`

## [CS0618] AwaitedDoAfterEvent — 2x

> Dont use async DoAfters

**Fix hint:** Convert `AwaitedDoAfterEvent` async DoAfters to event-driven DoAfter handling (start + `OnDoAfter` event).

- [ ] `Content.Server\Engineering\EntitySystems\SpawnAfterInteractSystem.cs(53,104)`
- [ ] `Content.Server\Construction\ConstructionSystem.Initial.cs(256,85)`

## [CS0618] SharedDoAfterSystem.WaitDoAfter(DoAfterArgs, DoAfterComponent?) — 2x

> Use the synchronous version instead.

**Fix hint:** Replace obsolete async helper with its synchronous version.

- [ ] `Content.Server\Engineering\EntitySystems\SpawnAfterInteractSystem.cs(57,36)`
- [ ] `Content.Server\Construction\ConstructionSystem.Initial.cs(266,23)`

## [CS0618] ITileDefinitionManager.GetVariantTile(ITileDefinition, Random) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.DunGenReplaceTile.cs(37,32)`
- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.SplineDungeonConnector.cs(109,28)`

## [CS0618] StatusEffectsSystem.CanApplyEffect(EntityUid, string, StatusEffectsComponent?) — 2x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Server\Electrocution\ElectrocutionSystem.cs(386,14)`
- [ ] `Content.Server\Electrocution\ElectrocuteCommand.cs(35,14)`

## [CS0618] RandomExtensions.NextFloat(Random, float, float) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\NPC\Pathfinding\PathfindingSystem.Splines.cs(89,73)`
- [ ] `Content.Server\NPC\Pathfinding\PathfindingSystem.Widen.cs(58,25)`

## [CS0618] NetworkResourceUploadMessage — 1x

> The engine no longer uses this message

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Server\Administration\ContentNetworkResourceManager.cs(25,65)`

## [CS0618] IComponent.Owner — 1x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites.

- [ ] `Content.Server\_Funkystation\Atmos\Reactions\PluoxiumRadiationProductionReaction.cs(46,48)`

## [CS0618] RandomExtensions.NextFloat(Random) — 1x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Salvage\SpawnSalvageMissionJob.cs(164,96)`

## [CS0612] IMapManager.FindGridsIntersecting(MapId, Box2Rotated, bool, bool) — 1x

**Fix hint:** Replace obsolete `IMapManager.FindGridsIntersecting` with `MapSystem` equivalent.

- [ ] `Content.Server\Salvage\SalvageSystem.Magnet.cs(440,17)`

## [CS0618] IRobustRandom.GetRandom() — 1x

> Do not access the underlying implementation

**Fix hint:** Remove `.GetRandom()` on `IRobustRandom`; use the `IRobustRandom` methods directly (`NextFloat`, `Pick`, `Shuffle`, `Prob`).

- [ ] `Content.Server\Procedural\DungeonSystem.Rooms.cs(254,136)`

## [CS0618] RandomExtensions.NextGaussian(Random, double, double) — 1x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Noise.cs(39,23)`

## [CS0618] TransformComponent.Anchored.set — 1x

> Use the SharedTransformSystem.AnchorEntity/Unanchor methods instead.

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Server\Construction\ConstructionSystem.Graph.cs(369,13)`

## [CS0618] RandomExtensions.NextAngle(Random, Angle, Angle) — 1x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Server\Procedural\DungeonJob\DungeonJob.Worm.cs(58,26)`

## [CS0618] SharedSolutionContainerSystem.SplitSolutionWithout(Entity<SolutionComponent>, FixedPoint2, params string[]) — 1x

> Use SplitSolutionWithout with params ProtoId<ReagentPrototype>

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Server\Chemistry\TileReactions\CleanTileReaction.cs(54,29)`

## [CS0618] EntityCoordinates.GetMapUid(IEntityManager) — 1x

> Use SharedTransformSystem.GetMap()

**Fix hint:** Use `SharedTransformSystem` (`ToMapCoordinates`, `GetMapId`, `GetGrid`, `AnchorEntity/Unanchor`, `SetLocalRotation(EntityUid, ...)`) instead of `EntityCoordinates`/`TransformComponent` direct APIs.

- [ ] `Content.Server\Administration\Logs\Converters\EntityCoordinatesConverter.cs(26,22)`

## [CS0612] SolutionContainerManagerComponent — 1x

**Fix hint:** Migrate off obsolete `SolutionContainerManagerComponent` to `SolutionManagerComponent` + `SolutionComponent` relations.

- [ ] `Content.Server\BloodCult\EntitySystems\ReagentAutoRefillSystem.cs(33,71)`

## [CS0618] NetworkResourceManager.OnResourceUploaded — 1x

> Use ResourcesUploaded instead

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Server\Administration\ContentNetworkResourceManager.cs(22,9)`
