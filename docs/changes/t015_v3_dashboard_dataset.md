# T015-V3 — Dashboard Dataset Model

## Milestone
Version 3

## Goal
Create a dataset model that groups the raw dashboard data needed by the dashboard feature.

## Changes
- Added DashboardDataset model.
- DashboardDataset groups sales records and inventory items.
- Prepared the project for the upcoming DashboardDataSource contract.

## Architecture Rule
DashboardDataset is a pure model.
It must not import Flutter UI.
It must not calculate dashboard metrics.
It must not know about repositories, data sources, or pages.

## Files Added
- lib/features/dashboard/models/dashboard_dataset.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
