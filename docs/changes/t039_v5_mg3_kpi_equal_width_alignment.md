# T039-V5-MG3 — KPI Row Equal Width Alignment

## Milestone
Version 5

## Goal
Improve KPI row visual alignment by making KPI cards distribute evenly across the available dashboard width.

## Problem
After adding the sixth KPI card, the row still had visible empty space at the end because each KPI card had a fixed width.

## Changes
- Removed fixed width from KpiCard.
- Updated _KpiSection to use equal-width Expanded cards on wide screens.
- Preserved Wrap layout for narrower screens.
- Improved horizontal alignment of the KPI row.

## Architecture Rule
This stage is a small visual improvement only.
No business calculations were changed.
No CSV parsing logic was changed.
No repository logic was changed.
No data source logic was changed.
No models were changed.
No routes were changed.
No external packages were added.

## Files Modified
- lib/core/widgets/kpi_card.dart
- lib/features/dashboard/pages/dashboard_page.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
