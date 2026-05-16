# T002-R2 — Flutter Project Rescue Fixes

## Problem
After creating the valid Flutter project, two remaining issues appeared:
- ThemeData expected CardThemeData instead of CardTheme.
- The default widget test still referenced MyApp.

## Fix
- Replaced CardTheme with CardThemeData in app_theme.dart.
- Updated widget_test.dart to pump DashboardApp instead of MyApp.

## Gate Decision
PASS if flutter analyze returns no issues.
