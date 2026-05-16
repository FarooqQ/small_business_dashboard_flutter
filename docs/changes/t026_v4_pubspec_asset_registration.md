# T026-V4 — pubspec.yaml Asset Registration

## Milestone
Version 4

## Goal
Register the CSV sample files as Flutter assets.

## Changes
- Registered assets/data/sales.csv in pubspec.yaml.
- Registered assets/data/inventory.csv in pubspec.yaml.
- Ran flutter pub get after updating pubspec.yaml.
- Confirmed that Flutter can recognize the CSV asset files.

## Architecture Rule
This stage only registers static CSV assets.
No Dart data source implementation was added.
No UI was changed.
No repository logic was changed.
No CSV parsing logic was added.
No external packages were added.

## Files Modified
- pubspec.yaml

## Files Registered
- assets/data/sales.csv
- assets/data/inventory.csv

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
