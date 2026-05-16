# R002-R1-MG1 — Public Version Label Alignment

## Release Track
R1

## Public Release Version
Release 1.0.0

## Goal
Align the dashboard public version label with the new Release 1.0.0 track.

## Problem
The dashboard configuration still displayed the internal development label Version 7, while the project has now entered the public/freelance release track.

## Changes
- Updated dashboardVersionLabel from Version 7 to Release 1.0.0.
- Updated widget_test.dart expectation.
- Updated default_client_config_test.dart expectation.

## Architecture Rule
This stage updates public release metadata only.
No business calculations were changed.
No CSV parsing logic was changed.
No repository logic was changed.
No report generation logic was changed.
No UI layout was changed.
No external packages were added.

## Files Modified
- lib/features/dashboard/config/default_client_config.dart
- test/widget_test.dart
- test/features/dashboard/config/default_client_config_test.dart

## Gate Result
flutter analyze: No issues found
flutter test: All tests passed

## Gate Decision
PASS
