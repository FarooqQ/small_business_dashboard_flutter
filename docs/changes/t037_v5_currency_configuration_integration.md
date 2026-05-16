# T037-V5 — Currency Configuration Integration

## Milestone
Version 5

## Goal
Connect KPI currency display to the default client configuration.

## Changes
- Used defaultClientConfig.currencySymbol inside _KpiSection.
- Added a local money formatter function for currency-based KPI values.
- Updated Total Sales to use configured currency symbol.
- Updated Total Profit to use configured currency symbol.
- Updated Average Order to use configured currency symbol.
- Kept non-money KPIs unchanged.

## Architecture Rule
This stage only connects currency display to client configuration.
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
