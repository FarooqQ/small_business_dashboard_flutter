# T038-V5 — CSV Asset Path Configuration

## Milestone
Version 5

## Goal
Connect CSV asset paths to the default client configuration.

## Changes
- Imported defaultClientConfig into DashboardRepository.
- Updated DashboardRepository.defaultRepository() to read CSV paths from config.
- Updated DashboardRepository.csv() to accept sales and inventory asset paths.
- Passed configured CSV asset paths to CsvDashboardDataSource.
- Preserved DashboardRepository.mock().
- Preserved DashboardPage cleanliness.

## Architecture Rule
This stage connects CSV paths to client configuration.
DashboardPage was not changed.
DashboardPage still does not know CSV asset paths.
DashboardPage still does not parse CSV.
CsvDashboardDataSource remains responsible for CSV loading and parsing.
DashboardRepository remains the coordination layer.
No external packages were added.

## Files Modified
- lib/features/dashboard/repositories/dashboard_repository.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
