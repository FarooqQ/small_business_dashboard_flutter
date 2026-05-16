# T034-V5 — ClientConfig Model

## Milestone
Version 5

## Goal
Create the ClientConfig model that defines configurable client-specific dashboard values.

## Changes
- Added config folder under dashboard feature.
- Added ClientConfig model.
- Defined businessName.
- Defined dashboardVersionLabel.
- Defined dashboardSubtitle.
- Defined currencySymbol.
- Defined topProductLabel.
- Defined salesCsvAssetPath.
- Defined inventoryCsvAssetPath.

## Architecture Rule
ClientConfig is a pure configuration model.
It must not import Flutter UI.
It must not read CSV files.
It must not parse data.
It must not calculate dashboard metrics.
It must not know about DashboardPage, DashboardRepository, or DashboardDataSource.

## Files Added
- lib/features/dashboard/config/client_config.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
