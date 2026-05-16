# T016-V3 — Dashboard Data Source Contract

## Milestone
Version 3

## Goal
Create a formal data source contract for loading dashboard datasets.

## Changes
- Added data_sources folder.
- Added DashboardDataSource abstract contract.
- Defined loadDashboardDataset as the standard method for dashboard data loading.
- Used Future<DashboardDataset> to prepare for future asynchronous data sources such as CSV, Excel, API, or database.

## Architecture Rule
DashboardDataSource is a contract only.
It must not import Flutter UI.
It must not know about DashboardPage.
It must not know about DashboardCalculator.
It must not contain actual business data.
It must not decide how metrics are calculated.

## Files Added
- lib/features/dashboard/data_sources/dashboard_data_source.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
