# T027-V4 — CSV Parsing Helpers

## Milestone
Version 4

## Goal
Create reusable CSV parsing helper logic without adding external packages.

## Changes
- Added CsvTable model for parsed CSV data.
- Added CsvParsingHelpers utility class.
- Added parseTable method for converting CSV text into rows.
- Added required column validation.
- Added requiredString, requiredInt, requiredDouble, and requiredDate helpers.
- Added basic CSV line splitting with quote handling.
- Added UTF-8 BOM cleanup for the first header.

## Architecture Rule
This stage adds parsing helper logic only.
No DashboardPage changes were made.
No DashboardRepository changes were made.
No CsvDashboardDataSource was added yet.
No asset reading was implemented yet.
No external packages were added.

## Files Added
- lib/features/dashboard/data_sources/csv_parsing_helpers.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
