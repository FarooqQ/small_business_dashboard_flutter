# T023-V4 — CSV / Excel Data Support Scope Lock

## Project Name
Small Business Dashboard Starter

## Flutter Project Name
small_business_dashboard_flutter

## Milestone
Version 4

## Version 4 Title
CSV / Excel Data Support

---

## 1. Purpose of Version 4

The purpose of Version 4 is to start replacing mock dashboard data with file-based business data.

Version 1 proved that the dashboard works.

Version 2 improved the visual design.

Version 3 introduced data source abstraction.

Version 4 will use the abstraction created in Version 3 to support CSV-based dashboard data.

The goal is to prepare the project for real small business datasets without rewriting DashboardPage.

---

## 2. Main Strategy

Version 4 will start with CSV support.

CSV is selected first because:
- It is simple.
- It does not require external packages.
- It is easy to create from Excel.
- It is suitable for small business data exports.
- It allows testing real file-based data flow early.

Native Excel file support may be considered later after the CSV flow is stable.

---

## 3. Excel Support Meaning in Version 4

In this version, Excel support means Excel-compatible workflow.

A business user can prepare data in Excel and export it as CSV.

The Flutter app will read the CSV files.

Native .xlsx reading is not included in the first part of Version 4.

---

## 4. What Version 4 Will Do

Version 4 will introduce:

- CSV schema definition
- sample sales.csv
- sample inventory.csv
- asset registration for CSV files
- CSV parsing helper logic
- CsvDashboardDataSource
- repository factory for CSV data
- dashboard runtime review using CSV data
- final V4 documentation

---

## 5. What Version 4 Will Not Do

Version 4 will not implement:

- Native .xlsx parsing in the first stage
- Database connection
- API integration
- File picker
- User upload system
- Authentication
- User roles
- PDF export
- Excel export
- Dashboard redesign
- New chart library
- Full testing suite

---

## 6. Architecture Rules for Version 4

The following rules must be respected:

- DashboardPage must not parse CSV.
- DashboardPage must not read files directly.
- DashboardPage must not know CSV column names.
- CSV parsing must stay inside data source or helper layer.
- CsvDashboardDataSource must implement DashboardDataSource.
- DashboardRepository must remain the coordination layer.
- DashboardCalculator must remain responsible for calculations.
- Existing MockDashboardDataSource must not be deleted.
- Existing mock data must not be deleted.
- No route changes unless explicitly required.
- No UI redesign during CSV support stages.

---

## 7. Expected Version 4 Data Flow

The intended CSV flow is:

DashboardPage
↓
DashboardRepository
↓
DashboardDataSource
↓
CsvDashboardDataSource
↓
CSV Assets
↓
DashboardDataset
↓
DashboardCalculator
↓
DashboardSummary

---

## 8. Expected CSV Files

The expected CSV files are:

- assets/data/sales.csv
- assets/data/inventory.csv

---

## 9. Expected New Files

The expected new files are:

- assets/data/sales.csv
- assets/data/inventory.csv
- lib/features/dashboard/data_sources/csv_dashboard_data_source.dart
- lib/features/dashboard/data_sources/csv_parsing_helpers.dart

---

## 10. Expected Modified Files

The expected modified files are:

- pubspec.yaml
- lib/features/dashboard/repositories/dashboard_repository.dart
- possibly lib/features/dashboard/pages/dashboard_page.dart

---

## 11. Success Criteria for Version 4

Version 4 is successful when:

- CSV sample files exist.
- CSV assets are registered.
- CsvDashboardDataSource exists.
- CsvDashboardDataSource implements DashboardDataSource.
- DashboardRepository can load dashboard data from CSV.
- DashboardPage remains free from CSV parsing logic.
- The dashboard runs using CSV-based data.
- flutter analyze returns No issues found.
- Runtime review passes.
- Final V4 documentation is completed.

---

## 12. Final Decision for This Stage

T023-V4 locks the scope of Version 4.

No code changes are introduced in this stage.

The project is ready to begin T024-V4 — CSV Schema Definition.
