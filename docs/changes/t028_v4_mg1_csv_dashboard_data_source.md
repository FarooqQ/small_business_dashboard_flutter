# T028-V4-MG1 — Create CsvDashboardDataSource

## Milestone
Version 4

## Goal
Create a CSV-based dashboard data source that implements DashboardDataSource.

## Changes
- Added CsvDashboardDataSource.
- Loaded sales.csv from Flutter assets.
- Loaded inventory.csv from Flutter assets.
- Parsed sales CSV rows into SaleRecord models.
- Parsed inventory CSV rows into InventoryItem models.
- Used CsvParsingHelpers for parsing, validation, and type conversion.
- Returned a DashboardDataset from CSV-based data.

## Architecture Rule
CsvDashboardDataSource is a data source implementation.
It may read CSV assets.
It may parse CSV rows.
It may create SaleRecord and InventoryItem models.
It must not know about DashboardPage.
It must not know about KPI cards, charts, or UI widgets.
It must not calculate dashboard summary metrics.
DashboardCalculator remains responsible for calculations.

## Files Added
- lib/features/dashboard/data_sources/csv_dashboard_data_source.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
