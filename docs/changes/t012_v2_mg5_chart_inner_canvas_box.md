# T012-V2-MG5 — Chart Inner Canvas Box Polish

## Milestone
Version 2

## Goal
Improve the Sales by Category chart visually by placing the chart content inside a light inner canvas box.

## Problem
The chart area was visually clearer than before, but it still lacked an internal bounded canvas that groups bars, grid lines, values, and labels more cleanly.

## Changes
- Added a light inner canvas box to MiniBarChart.
- Added subtle background color inside the chart canvas.
- Added a light border and rounded corners.
- Kept the existing chart bars, grid lines, value labels, and category labels.
- Preserved the MiniBarChart public API.

## Architecture Rule
This micro-gate is UI-only.
No changes were made to:
- DashboardPage
- Models
- Mock data
- DashboardCalculator
- KPI Card
- Routes
- External dependencies

## Files Modified
- lib/features/dashboard/widgets/mini_bar_chart.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
