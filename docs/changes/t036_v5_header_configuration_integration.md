# T036-V5 — Header Configuration Integration

## Milestone
Version 5

## Goal
Connect the dashboard header text to the default client configuration.

## Changes
- Imported defaultClientConfig into DashboardPage.
- Updated dashboard title to use config.businessName.
- Updated version label and subtitle to use config.dashboardVersionLabel and config.dashboardSubtitle.
- Updated Top Product label to use config.topProductLabel.
- Removed hard-coded client-facing header text from _DashboardHeader.

## Architecture Rule
This stage only connects header text to client configuration.
No business calculations were changed.
No CSV parsing logic was changed.
No repository logic was changed.
No data source logic was changed.
No models were changed.
No routes were changed.
No external packages were added.

## Files Modified
- lib/features/dashboard/pages/dashboard_page.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
