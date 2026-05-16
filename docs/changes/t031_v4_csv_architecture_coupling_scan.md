# T031-V4 — CSV Architecture Coupling Scan

## Milestone
Version 4

## Goal
Verify that CSV loading and parsing logic is not leaking into DashboardPage.

## Checks

### Check 1
DashboardPage should not directly contain:
- CsvDashboardDataSource
- csv_dashboard_data_source
- sales.csv
- inventory.csv
- rootBundle
- CsvParsingHelpers
- direct CSV parsing logic

### Check 2
DashboardRepository may contain:
- DashboardRepository.csv()
- CsvDashboardDataSource

### Check 3
CsvDashboardDataSource may contain:
- rootBundle
- sales.csv
- inventory.csv
- CsvParsingHelpers
- DashboardDataset
- SaleRecord
- InventoryItem

## Architecture Result
CSV logic remains behind the data source layer.
DashboardPage remains a presentation layer.
DashboardRepository remains the coordination layer.
CsvDashboardDataSource remains responsible for file loading and parsing.

## Architecture Rule
DashboardPage must not parse CSV.
DashboardPage must not read asset files.
DashboardPage must not know CSV column names.
CSV-specific logic must remain inside CsvDashboardDataSource and CSV helper logic.

## Files Reviewed
- lib/features/dashboard/pages/dashboard_page.dart
- lib/features/dashboard/repositories/dashboard_repository.dart
- lib/features/dashboard/data_sources/csv_dashboard_data_source.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
