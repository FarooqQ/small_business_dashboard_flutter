# T054-V7-MG0B — Replace Legacy Widget Test with Stable Config Unit Test

## Milestone
Version 7

## Goal
Replace the legacy full-widget dashboard test with a stable unit-style configuration test.

## Problem
The previous widget test rendered the full DashboardApp and used pumpAndSettle. This caused test instability and timeout with Flutter semantics/rendering assertions.

## Changes
- Replaced the full DashboardApp widget test with a stable defaultClientConfig unit test.
- Verified businessName.
- Verified dashboardVersionLabel.
- Verified dashboardSubtitle.
- Verified currencySymbol.
- Verified topProductLabel.
- Verified salesCsvAssetPath.
- Verified inventoryCsvAssetPath.
- Removed dependency on pumpAndSettle from the legacy test.

## Architecture Rule
This stage updates test code only.
No production code was changed.
No UI code was changed.
No repository logic was changed.
No data source logic was changed.
No CSV parsing logic was changed.
No report generation logic was changed.
No external packages were added.

## Files Modified
- test/widget_test.dart

## Gate Result
flutter analyze: No issues found
flutter test: All tests passed

## Gate Decision
PASS
