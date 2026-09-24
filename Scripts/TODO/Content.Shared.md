# Content.Shared — warnings to fix (fork code, safe to edit)

_Source: `Scripts/logs/Content.Tests.log`. Fork-owned code — fix here. Checkboxes track progress._

Total in this file: **137**

## [CS0618] DamageGroupPrototype — 31x

> Do not rely on DamageGroupPrototype for anything besides grouping logically similar damage in UIs

**Fix hint:** DO NOT mass-fix now. `DamageGroupPrototype` stays valid only for UI grouping. Code relying on it for logic needs redesign alongside damage-model refactor.

- [ ] `Content.Shared\Damage\Components\DamageableComponent.cs(54,31)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(298,41)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(323,35)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(331,90)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(103,32)`
- [ ] `Content.Shared\Damage\DamageVisualizerKeys.cs(19,29)`
- [ ] `Content.Shared\Damage\DamageVisualizerKeys.cs(21,55)`
- [ ] `Content.Shared\Damage\ForceSay\DamageForceSayComponent.cs(46,28)`
- [ ] `Content.Shared\Damage\Prototypes\DamageContainerPrototype.cs(25,29)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.API.cs(180,17)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.API.cs(251,17)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.API.cs(287,17)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.API.cs(302,87)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.cs(81,96)`
- [ ] `Content.Shared\Damage\Components\InjurableComponent.cs(29,25)`
- [ ] `Content.Shared\Weapons\Melee\Components\MeleeSoundComponent.cs(18,86)`
- [ ] `Content.Shared\Destructible\Triggers\DamageGroupTrigger.cs(21,20)`
- [ ] `Content.Shared\GhostTypes\LastBodyDamageComponent.cs(19,31)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Shared.CompNetworkGenerator\Robust.Shared.CompNetworkGenerator.ComponentNetworkGenerator\LastBodyDamageComponent_CompNetwork.g.cs(25,103)`
- [ ] `Content.Shared\EntityEffects\Effects\Damage\DistributedHealthChangeEntityEffectSystem.cs(36,31)`
- [ ] `Content.Shared\EntityEffects\Effects\Damage\EvenHealthChangeEntityEffectSystem.cs(35,31)`
- [ ] `Content.Shared\Xenoarchaeology\Artifact\XAT\Components\XATDamageThresholdReachedComponent.cs(37,31)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Shared.CompNetworkGenerator\Robust.Shared.CompNetworkGenerator.ComponentNetworkGenerator\XATDamageThresholdReachedComponent_CompNetwork.g.cs(27,103)`
- [ ] `Content.Shared\Damage\DamageVisualizerKeys.cs(28,67)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(325,47)`
- [ ] `Content.Shared\Damage\DamageSpecifier.cs(334,68)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.cs(87,49)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.Events.cs(126,76)`
- [ ] `Content.Shared\GhostTypes\StoreDamageTakenOnMindSystem.cs(62,48)`
- [ ] `Content.Shared\GhostTypes\StoreDamageTakenOnMindSystem.cs(65,54)`
- [ ] `Content.Shared\GhostTypes\StoreDamageTakenOnMindSystem.cs(65,54)`

## [CS0618] DamageChangedEvent — 25x

> Will be replaced with damage-model specific events; general 

**Fix hint:** DO NOT mass-fix now. `DamageChangedEvent` -> subscribe to `DamageDealtEvent` / damage-model specific events per upstream EE/WizDen migration. Large refactor, track upstream first.

- [ ] `Content.Shared\Damage\Systems\DamagePopupSystem.cs(19,71)`
- [ ] `Content.Shared\Damage\Systems\SlowOnDamageSystem.cs(61,82)`
- [ ] `Content.Shared\Body\Systems\SharedBloodstreamSystem.cs(188,72)`
- [ ] `Content.Shared\Light\EntitySystems\SharedPoweredLightSystem.cs(330,84)`
- [ ] `Content.Shared\Mobs\Systems\MobThresholdSystem.cs(427,81)`
- [ ] `Content.Shared\DoAfter\SharedDoAfterSystem.cs(80,70)`
- [ ] `Content.Shared\Stunnable\SharedStunSystem.Knockdown.cs(496,65)`
- [ ] `Content.Shared\Polymorph\Systems\SharedChameleonProjectorSystem.cs(71,80)`
- [ ] `Content.Shared\_ES\PainFlash\ESSharedPainFlashSystem.cs(19,83)`
- [ ] `Content.Shared\_ES\PainFlash\ESSharedPainFlashSystem.cs(21,36)`
- [ ] `Content.Shared\Xenoarchaeology\Artifact\XAT\XATDamageThresholdReachedSystem.cs(24,154)`
- [ ] `Content.Shared\Bed\Sleep\SleepingSystem.cs(252,69)`
- [ ] `Content.Shared\Bed\Sleep\SleepingSystem.cs(59,48)`
- [ ] `Content.Shared\Body\Systems\SharedBloodstreamSystem.cs(56,51)`
- [ ] `Content.Shared\Damage\Systems\SlowOnDamageSystem.cs(19,52)`
- [ ] `Content.Shared\Damage\Systems\DamageableSystem.cs(74,34)`
- [ ] `Content.Shared\Damage\Systems\DamagePopupSystem.cs(15,51)`
- [ ] `Content.Shared\DoAfter\SharedDoAfterSystem.cs(37,47)`
- [ ] `Content.Shared\_ES\PainFlash\ESSharedPainFlashSystem.cs(16,51)`
- [ ] `Content.Shared\Xenoarchaeology\Artifact\XAT\XATDamageThresholdReachedSystem.cs(21,33)`
- [ ] `Content.Shared\Light\EntitySystems\SharedPoweredLightSystem.cs(55,52)`
- [ ] `Content.Shared\Mobs\Systems\MobThresholdSystem.cs(27,53)`
- [ ] `Content.Shared\Xenoarchaeology\Artifact\SharedXenoArtifactSystem.XAT.cs(19,28)`
- [ ] `Content.Shared\Polymorph\Systems\SharedChameleonProjectorSystem.cs(46,57)`
- [ ] `Content.Shared\Stunnable\SharedStunSystem.Knockdown.cs(66,47)`

## [CS0618] DamageableSystem.GetTotalDamage(Entity<DamageableComponent?>) — 14x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Shared\Chat\SharedSuicideSystem.cs(32,75)`
- [ ] `Content.Shared\Chat\SharedSuicideSystem.cs(59,75)`
- [ ] `Content.Shared\Damage\Systems\SlowOnDamageSystem.cs(37,27)`
- [ ] `Content.Shared\Damage\Systems\DamagePopupSystem.cs(23,31)`
- [ ] `Content.Shared\Destructible\Triggers\DamageTrigger.cs(23,16)`
- [ ] `Content.Shared\Medical\SuitSensors\SharedSuitSensorSystem.cs(398,27)`
- [ ] `Content.Shared\Mobs\Systems\MobThresholdSystem.cs(343,17)`
- [ ] `Content.Shared\Mobs\Systems\MobThresholdSystem.cs(409,67)`
- [ ] `Content.Shared\Medical\SharedDefibrillatorSystem.cs(213,17)`
- [ ] `Content.Shared\Medical\Healing\HealingSystem.cs(249,37)`
- [ ] `Content.Shared\Repairable\RepairableSystem.cs(34,27)`
- [ ] `Content.Shared\Repairable\RepairableSystem.cs(45,23)`
- [ ] `Content.Shared\Repairable\RepairableSystem.cs(104,13)`
- [ ] `Content.Shared\Silicons\Bots\MedibotSystem.cs(112,21)`

## [CS0618] StatusEffectsSystem — 8x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Shared\Flash\SharedFlashSystem.cs(41,26)`
- [ ] `Content.Shared\Jittering\SharedJitteringSystem.cs(13,32)`
- [ ] `Content.Shared\StatusEffect\StatusEffectsComponent.cs(8,20)`
- [ ] `Content.Shared\StatusEffect\StatusEffectsComponent.cs(17,62)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Shared.Flash.SharedFlashSystem.g.cs(25,28)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Shared.Flash.SharedFlashSystem.g.cs(50,33)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Shared.Jittering.SharedJitteringSystem.g.cs(16,27)`
- [ ] `Content.Shared\obj\DebugOpt\Robust.Analyzers\Robust.Analyzers.Generators.HasDependenciesGenerator\Content.Shared.Jittering.SharedJitteringSystem.g.cs(28,26)`

## [CS0618] SharedSolutionContainerSystem.EnsureSolution(Entity<SolutionManagerComponent?>, string, out Entity<SolutionComponent>) — 6x

> Solution string matching will be removed in the future in favor of relations and enumerators.

**Fix hint:** Migrate `EnsureSolution(Entity, string, ...)` to relation/enumerator-based solution API. See `SharedSolutionContainerSystem` new overloads. Per-system migration.

- [ ] `Content.Shared\Body\Systems\SharedBloodstreamSystem.cs(122,9)`
- [ ] `Content.Shared\Body\Systems\SharedBloodstreamSystem.cs(123,9)`
- [ ] `Content.Shared\Body\Systems\SharedBloodstreamSystem.cs(124,9)`
- [ ] `Content.Shared\Body\Systems\LungSystem.cs(49,9)`
- [ ] `Content.Shared\Chemistry\EntitySystems\SharedSolutionContainerSystem.Compatibility.cs(63,17)`
- [ ] `Content.Shared\Nutrition\EntitySystems\IngestionSystem.cs(141,9)`

## [CS0618] DamageableSystem.GetAllDamage(Entity<DamageableComponent?>) — 6x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Shared\Destructible\Triggers\DamageTypeTrigger.cs(31,16)`
- [ ] `Content.Shared\GhostTypes\StoreDamageTakenOnMindSystem.cs(71,31)`
- [ ] `Content.Shared\HealthExaminable\HealthExaminableSystem.cs(53,31)`
- [ ] `Content.Shared\Mobs\Systems\MobThresholdSystem.cs(274,19)`
- [ ] `Content.Shared\Medical\Stethoscope\StethoscopeSystem.cs(102,14)`
- [ ] `Content.Shared\Medical\Healing\HealingSystem.cs(132,30)`

## [CS0618] RandomExtensions.NextFloat(Random) — 5x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\Maps\TileSystem.cs(129,20)`
- [ ] `Content.Shared\Metabolism\MetabolizerSystem.cs(207,21)`
- [ ] `Content.Shared\Random\Helpers\SharedRandomExtensions.cs(32,24)`
- [ ] `Content.Shared\Random\Helpers\SharedRandomExtensions.cs(118,24)`
- [ ] `Content.Shared\Random\RandomSystem.cs(44,21)`

## [CS0612] SolutionContainerManagerComponent — 4x

**Fix hint:** Migrate off obsolete `SolutionContainerManagerComponent` to `SolutionManagerComponent` + `SolutionComponent` relations.

- [ ] `Content.Shared\Chemistry\EntitySystems\SharedSolutionContainerSystem.Compatibility.cs(20,49)`
- [ ] `Content.Shared\Chemistry\EntitySystems\SharedSolutionContainerSystem.Compatibility.cs(17,29)`
- [ ] `Content.Shared\Chemistry\EntitySystems\SharedSolutionContainerSystem.Compatibility.cs(39,46)`
- [ ] `Content.Shared\Chemistry\EntitySystems\SharedSolutionContainerSystem.Compatibility.cs(67,46)`

## [CS0618] RandomHelpers.Shuffle<T>(Random, IList<T>) — 4x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\Metabolism\MetabolizerSystem.cs(149,9)`
- [ ] `Content.Shared\Random\RandomSystem.cs(18,9)`
- [ ] `Content.Shared\Salvage\SharedSalvageSystem.cs(80,9)`
- [ ] `Content.Shared\Salvage\SharedSalvageSystem.cs(99,9)`

## [CS0618] RandomHelpers.Prob(Random, double) — 3x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\EntityTable\EntitySelectors\EntityTableSelector.cs(55,18)`
- [ ] `Content.Shared\Random\Helpers\SharedRandomExtensions.cs(241,20)`
- [ ] `Content.Shared\Storage\EntitySpawnEntry.cs(170,50)`

## [CS0618] BeforeOldStatusEffectAddedEvent — 2x

> Migration to StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Shared\Damage\Systems\SharedGodmodeSystem.cs(48,76)`
- [ ] `Content.Shared\Damage\Systems\SharedGodmodeSystem.cs(25,47)`

## [CS0618] RandomExtensions.NextFloat(Random, float, float) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\Animals\ShearableSystem.cs(211,25)`
- [ ] `Content.Shared\Animals\ShearableSystem.cs(212,25)`

## [CS0618] RandomExtensions.Pick<T>(Random, ICollection<T>) — 2x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\Clothing\SharedCursedMaskSystem.cs(66,33)`
- [ ] `Content.Shared\Salvage\SharedSalvageSystem.Magnet.cs(82,26)`

## [CS0618] HideLayerClothingComponent.Slots — 2x

> This attribute is deprecated, please use Layers instead.

**Fix hint:** Replace `HideLayerClothingComponent.Slots` with `Layers`.

- [ ] `Content.Shared\Clothing\EntitySystems\FoldableClothingSystem.cs(70,17)`
- [ ] `Content.Shared\Clothing\EntitySystems\FoldableClothingSystem.cs(86,17)`

## [CS0618] DamageableSystem.GetDamagePerGroup(Entity<DamageableComponent?>) — 2x

> Do not rely on the ability to determine a numerically quantifiable amount of damage

**Fix hint:** DO NOT mass-fix now. `GetTotalDamage/GetAllDamage/GetDamagePerGroup` are slated for removal. Any fix requires gameplay-logic redesign (thresholds, healing, sensors). Defer until damage-model refactor lands upstream.

- [ ] `Content.Shared\Destructible\Triggers\DamageGroupTrigger.cs(31,16)`
- [ ] `Content.Shared\GhostTypes\StoreDamageTakenOnMindSystem.cs(63,36)`

## [CS0618] IRobustRandom.GetRandom() — 2x

> Do not access the underlying implementation

**Fix hint:** Remove `.GetRandom()` on `IRobustRandom`; use the `IRobustRandom` methods directly (`NextFloat`, `Pick`, `Shuffle`, `Prob`).

- [ ] `Content.Shared\EntityTable\EntityTableSystem.cs(25,18)`
- [ ] `Content.Shared\Maps\TileSystem.cs(108,34)`

## [CS0618] StatusEffectsSystem.TryAddStatusEffect<T>(EntityUid, string, TimeSpan, bool, StatusEffectsComponent?) — 2x

> Migration to Content.Shared.StatusEffectNew.StatusEffectsSystem is required

**Fix hint:** Migrate to `Content.Shared.StatusEffectNew.StatusEffectsSystem` (new API). Check upstream examples; old `StatusEffectsSystem.TryAddStatusEffect` calls need new-system equivalents. Medium-large task per system.

- [ ] `Content.Shared\Flash\SharedFlashSystem.cs(189,14)`
- [ ] `Content.Shared\Jittering\SharedJitteringSystem.cs(55,17)`

## [CS0618] Component.Owner — 2x

> Update your API to allow accessing Owner through other means

**Fix hint:** Stop using `Component.Owner` / `IComponent.Owner`; thread `EntityUid` / `Entity<T>` through (system methods already take EntityUid). Mechanical but touches many call sites.

- [ ] `Content.Shared\Inventory\InventoryComponent.cs(27,94)`
- [ ] `Content.Shared\Shuttles\Components\RadarConsoleComponent.cs(17,23)`

## [CS0612] Component.Dirty(IEntityManager?) — 2x

**Fix hint:** Replace obsolete `Component.Dirty(IEntityManager?)` with `Dirty(entity, component)` / entity-system dirty pattern.

- [ ] `Content.Shared\Movement\Components\MobMoverComponent.cs(51,17)`
- [ ] `Content.Shared\Movement\Components\MobMoverComponent.cs(63,17)`

## [CS0618] BodySystem.TryGetOrgansWithComponent<TComp>(Entity<BodyComponent?>, out List<Entity<TComp>>) — 2x

> Use an event-relay based approach instead

**Fix hint:** Replace `BodySystem.TryGetOrgansWithComponent` direct queries with event-relay pattern (raise event on body, organ systems respond). Follow upstream body refactor examples.

- [ ] `Content.Shared\Nutrition\EntitySystems\IngestionSystem.cs(245,14)`
- [ ] `Content.Shared\Nutrition\EntitySystems\IngestionSystem.cs(310,14)`

## [CS0618] SharedStackSystem.SetCount(EntityUid, int, StackComponent?) — 2x

> Use Entity<T> method instead

**Fix hint:** Switch to `Entity<T>` overloads, e.g. `SetCount(Entity<StackComponent>, ...)` / `SetAwake(Entity<PhysicsComponent>, ...)` / `SetLocalRotation(EntityUid, ...)` variants. Mechanical, low risk.

- [ ] `Content.Shared\Stacks\SharedStackSystem.API.cs(31,9)`
- [ ] `Content.Shared\Stacks\SharedStackSystem.cs(52,77)`

## [CS0618] ActionComponent.RaiseOnAction — 1x

> This datafield will be reworked in an upcoming action refactor

**Fix hint:** Leave `ActionComponent.RaiseOnAction` alone until action refactor lands upstream.

- [ ] `Content.Shared\Actions\SharedActionsSystem.cs(573,13)`

## [CS0618] Loc.TryGetString(string, out string?) — 1x

> Use ILocalizationManager

**Fix hint:** Replace static `Loc.TryGetString` with injected `ILocalizationManager`.

- [ ] `Content.Shared\DeviceNetwork\DeviceNetworkConstants.cs(74,21)`

## [CS0618] AwaitedDoAfterEvent — 1x

> Dont use async DoAfters

**Fix hint:** Convert `AwaitedDoAfterEvent` async DoAfters to event-driven DoAfter handling (start + `OnDoAfter` event).

- [ ] `Content.Shared\DoAfter\SharedDoAfterSystem.cs(225,104)`

## [CS0618] DoAfterArgs.ExtraCheck — 1x

> Use checkEvent instead

**Fix hint:** Replace `DoAfterArgs.ExtraCheck` with `checkEvent` pattern.

- [ ] `Content.Shared\DoAfter\SharedDoAfterSystem.Update.cs(148,13)`

## [CS0618] ComponentTreeSystem<OccluderTreeComponent, OccluderComponent>.IntersectRayWithPredicate<TState>(MapId, in Ray, float, TState, Func<EntityUid, TState, bool>, bool) — 1x

> use IntersectRay

**Fix hint:** Follow the message in the obsolete attribute; check upstream for the canonical replacement.

- [ ] `Content.Shared\Examine\ExamineSystemShared.cs(197,30)`

## [CS0618] EntityCoordinates.ToMapPos(IEntityManager, SharedTransformSystem) — 1x

> Use SharedTransformSystem.ToMapCoordinates()

**Fix hint:** Use `SharedTransformSystem` (`ToMapCoordinates`, `GetMapId`, `GetGrid`, `AnchorEntity/Unanchor`, `SetLocalRotation(EntityUid, ...)`) instead of `EntityCoordinates`/`TransformComponent` direct APIs.

- [ ] `Content.Shared\RCD\Systems\RCDSystem.cs(870,52)`

## [CS0618] EntityCoordinates.GetMapId(IEntityManager) — 1x

> Use SharedTransformSystem.GetMapId()

**Fix hint:** Use `SharedTransformSystem` (`ToMapCoordinates`, `GetMapId`, `GetGrid`, `AnchorEntity/Unanchor`, `SetLocalRotation(EntityUid, ...)`) instead of `EntityCoordinates`/`TransformComponent` direct APIs.

- [ ] `Content.Shared\RCD\Systems\RCDSystem.cs(870,102)`

## [CS0618] SharedPhysicsSystem.GetCollidingEntities(MapId, in Box2) — 1x

> Use EntityLookupSystem

**Fix hint:** Replace `SharedPhysicsSystem.GetCollidingEntities(...)` with `EntityLookupSystem` queries (`GetEntitiesInRange`, `IntersectRay`, etc.).

- [ ] `Content.Shared\Spawning\EntitySystemExtensions.cs(35,34)`

## [CS0618] RandomExtensions.NextPolarVector2(Random, float, float) — 1x

> Always use RobustRandom/IRobustRandom, System.Random does not provide any extra functionality.

**Fix hint:** Inject `IRobustRandom _random` (`[Dependency]`) and use `_random.NextFloat()/.Prob()/.Pick()/.Shuffle()` instead of `System.Random` extensions and `RandomHelpers.*(Random, ...)`. Never call `GetRandom()` / use `Random` directly.

- [ ] `Content.Shared\Tools\Systems\ToolRefinableSystem.cs(172,32)`
