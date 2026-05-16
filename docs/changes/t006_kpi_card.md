# T006 — KPI Card Widget

## Goal
Create a reusable KPI card widget for dashboard metrics.

## Changes
- Added KpiCard widget.
- Added title, value, subtitle, and icon parameters.
- Styled the card using the app theme and Material UI.

## Architecture Rule
KpiCard is a UI-only component.
It must not contain business calculations.
It must not access mock data, services, APIs, or dashboard summary directly.

## Files Added
- lib/core/widgets/kpi_card.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
