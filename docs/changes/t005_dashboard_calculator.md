# T005 — Dashboard Calculator Service

## Goal
Create a dedicated service for dashboard business calculations.

## Changes
- Added DashboardCalculator.
- Added DashboardSummary.
- Added CategorySales.
- Added calculations for total sales, total profit, total orders, average order value, top product, sales by category, and low stock items.

## Architecture Rule
Dashboard calculations must stay outside the UI layer.
DashboardPage must display prepared data only.
Models must remain simple and must not import Flutter UI.

## Files Added
- lib/features/dashboard/services/dashboard_calculator.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
