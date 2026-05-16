# T004 — Mock Business Data

## Goal
Add realistic mock business data for testing the dashboard before connecting to Excel, CSV, API, or database sources.

## Changes
- Added mock sales records.
- Added mock inventory records.
- Used existing SaleRecord and InventoryItem models.

## Architecture Rule
Mock data is temporary.
It must be replaceable later by a real data adapter such as Excel, CSV, API, or database.

## Files Added
- lib/features/dashboard/data/mock_business_data.dart

## Gate Result
flutter analyze: No issues found

## Gate Decision
PASS
