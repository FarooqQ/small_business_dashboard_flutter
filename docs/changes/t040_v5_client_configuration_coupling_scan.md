# T040-V5 — Client Configuration Coupling Scan

## Milestone
Version 5

## Goal
Verify that the client configuration layer is used correctly without leaking CSV loading or business logic into DashboardPage.

## Checks

### Check 1
DashboardPage should not directly contain:
- sales.csv
- inventory.csv
- rootBundle
- CsvDashboardDataSource
- CsvParsingHelpers
- salesCsvAssetPath
- inventoryCsvAssetPath

### Check 2
DashboardPage may use:
- defaultClientConfig
- businessName
- dashboardVersionLabel
- dashboardSubtitle
- currencySymbol
- topProductLabel

### Check 3
DashboardRepository may use:
- defaultClientConfig
- salesCsvAssetPath
- inventoryCsvAssetPath
- CsvDashboardDataSource
- DashboardRepository.defaultRepository

### Check 4
ClientConfig must remain a pure configuration model.

### Check 5
DefaultClientConfig must remain a static configuration source.

## Architecture Result
DashboardPage remains a presentation layer.
Client-facing text and currency now come from configuration.
CSV paths remain outside DashboardPage.
CSV loading remains inside CsvDashboardDataSource.
Repository remains the coordination layer.
ClientConfig does not contain business calculations.

## Architecture Rule
ClientConfig must not calculate dashboard metrics.
ClientConfig must not parse CSV.
ClientConfig must not read asset files directly.
DashboardPage must not know CSV paths.
DashboardPage must not parse CSV.
DashboardRepository is responsible for applying configured data source paths.

## Files Reviewed
- lib/features/dashboard/pages/dashboard_page.dart
- lib/features/dashboard/repositories/dashboard_repository.dart
- lib/features/dashboard/config/client_config.dart
- lib/features/dashboard/config/default_client_config.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
