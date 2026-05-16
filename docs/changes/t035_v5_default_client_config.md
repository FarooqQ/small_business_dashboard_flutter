# T035-V5 — Default Client Config

## Milestone
Version 5

## Goal
Create a default client configuration file for the current dashboard client setup.

## Changes
- Added defaultClientConfig.
- Added default business name.
- Added default dashboard version label.
- Added default dashboard subtitle.
- Added default currency symbol.
- Added default top product label.
- Added default sales CSV asset path.
- Added default inventory CSV asset path.

## Architecture Rule
DefaultClientConfig is a static configuration source.
It must not import Flutter UI.
It must not read CSV files.
It must not parse data.
It must not calculate dashboard metrics.
It must not know about DashboardPage, DashboardRepository, or DashboardDataSource.

## Files Added
- lib/features/dashboard/config/default_client_config.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
