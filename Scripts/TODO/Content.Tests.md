# Content.Tests — warnings to fix

_Source: `Scripts/logs/Content.Tests.log`. Fork-owned code — fix here. Checkboxes track progress._

Total in this file: **6**

## [NU1510] (no member) — 2x

> PackageReference System.Text.Json will not be pruned. Consider removing this package from your dependencies, as it is likely unnecessary. [G:\Servers\ss14\Starfall-Drift\Content.Tests\Content.Tests.csproj]

**Fix hint:** NU1510: remove unnecessary `PackageReference` (System.Text.Json, Microsoft.Win32.Registry, System.Reflection.Metadata) from Robust csprojs — upstream engine task, do NOT edit blindly; verify build still restores.

- [ ] `RobustToolbox\Robust.Client\Robust.Client.csproj`
- [ ] `RobustToolbox\Robust.Server\Robust.Server.csproj`

## [CS0618] DamageGroupPrototype — 2x

> Do not rely on DamageGroupPrototype for anything besides grouping logically similar damage in UIs

**Fix hint:** DO NOT mass-fix now. `DamageGroupPrototype` stays valid only for UI grouping. Code relying on it for logic needs redesign alongside damage-model refactor.

- [ ] `Content.Tests\Shared\DamageTest.cs(15,20)`
- [ ] `Content.Tests\Shared\DamageTest.cs(18,41)`

## [NU1510] (no member) — 1x

> PackageReference Microsoft.Win32.Registry will not be pruned. Consider removing this package from your dependencies, as it is likely unnecessary. [G:\Servers\ss14\Starfall-Drift\Content.Tests\Content.Tests.csproj]

**Fix hint:** NU1510: remove unnecessary `PackageReference` (System.Text.Json, Microsoft.Win32.Registry, System.Reflection.Metadata) from Robust csprojs — upstream engine task, do NOT edit blindly; verify build still restores.

- [ ] `RobustToolbox\Robust.Shared\Robust.Shared.csproj`

## [NU1510] (no member) — 1x

> PackageReference System.Reflection.Metadata will not be pruned. Consider removing this package from your dependencies, as it is likely unnecessary. [G:\Servers\ss14\Starfall-Drift\Content.Tests\Content.Tests.csproj]

**Fix hint:** NU1510: remove unnecessary `PackageReference` (System.Text.Json, Microsoft.Win32.Registry, System.Reflection.Metadata) from Robust csprojs — upstream engine task, do NOT edit blindly; verify build still restores.

- [ ] `RobustToolbox\Robust.Shared\Robust.Shared.csproj`
