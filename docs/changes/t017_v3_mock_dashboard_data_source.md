# T017-V3 — Mock Dashboard Data Source

## Milestone
Version 3

## Goal
Create a mock dashboard data source that implements the DashboardDataSource contract.

## Changes
- Added MockDashboardDataSource.
- Connected MockDashboardDataSource to the existing MockBusinessData.
- Returned sales and inventory through DashboardDataset.
- Prepared the project for repository-based data loading.

## Architecture Rule
MockDashboardDataSource is a data source adapter.
It may depend on MockBusinessData.
It must not import Flutter UI.
It must not know about DashboardPage.
It must not know about DashboardCalculator.
It must not calculate dashboard metrics.
It must only provide raw dashboard data.

## Files Added
- lib/features/dashboard/data_sources/mock_dashboard_data_source.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
