# T029-V4 — Repository CSV Factory

## Milestone
Version 4

## Goal
Add a CSV repository factory while preserving the existing mock repository factory.

## Changes
- Imported CsvDashboardDataSource into DashboardRepository.
- Added DashboardRepository.csv().
- Preserved DashboardRepository.mock().
- Kept DashboardRepository as the coordination layer between data sources and DashboardCalculator.

## Architecture Rule
This stage only adds a new repository factory.
DashboardPage was not changed.
MockDashboardDataSource was not deleted.
DashboardRepository.mock() was preserved.
DashboardCalculator was not changed.
No UI changes were made.
No routes were changed.
No external packages were added.

## Files Modified
- lib/features/dashboard/repositories/dashboard_repository.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
