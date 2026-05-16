# T014-V3 — Data Source Abstraction Scope Lock

## Project Name
Small Business Dashboard Starter

## Flutter Project Name
small_business_dashboard_flutter

## Milestone
Version 3

## Version 3 Title
Data Source Abstraction

---

## 1. Purpose of This Stage

The purpose of this stage is to lock the scope of Version 3 before writing any new code.

Version 3 is focused on separating the dashboard from its current direct dependency on mock data.

The goal is not to connect real files or real systems yet.

The goal is to prepare the architecture so that future data sources such as CSV, Excel, API, or database can be added later without rewriting the dashboard page.

---

## 2. Current Problem After Version 2

After Version 2, the dashboard is visually polished, but the data flow is still simple and direct.

The DashboardPage still depends on mock data and calculation logic directly.

This is acceptable for Version 1 and Version 2, but it is not suitable for future freelance client work.

A real client may provide data from:
- CSV files
- Excel files
- API endpoints
- Databases
- Manual exports from existing business systems

If the UI remains directly connected to mock data, every future data source will require changes inside the dashboard page.

That would weaken maintainability.

---

## 3. Version 3 Main Goal

The main goal of Version 3 is to introduce a clean data source abstraction layer.

The intended architecture is:

DashboardPage
↓
DashboardRepository
↓
DashboardDataSource
↓
MockDashboardDataSource
↓
MockBusinessData

This prepares the project for future versions where the data source can become:

- CsvDashboardDataSource
- ExcelDashboardDataSource
- ApiDashboardDataSource
- DatabaseDashboardDataSource

without major changes to the dashboard page.

---

## 4. What Version 3 Will Do

Version 3 will introduce:

- DashboardDataset model
- DashboardDataSource contract
- MockDashboardDataSource
- DashboardRepository
- Repository-based DashboardPage integration
- Loading state
- Error state
- Coupling scan
- Runtime review
- Final Version 3 documentation

---

## 5. What Version 3 Will Not Do

Version 3 will not implement:

- CSV reading
- Excel reading
- API integration
- Database connection
- PDF export
- Excel export
- Authentication
- User roles
- Client configuration
- New visual redesign
- New chart library
- New external packages
- Complete unit testing suite

These are intentionally postponed to later versions.

---

## 6. Version Boundaries

Version 3 is an architecture preparation milestone.

It must not become a real data integration milestone.

CSV and Excel support belong to Version 4.

Client configuration belongs to Version 5.

Export features belong to Version 6.

Unit testing and quality gates belong to Version 7.

Freelance delivery package belongs to Version 8.

---

## 7. Architecture Rules for Version 3

The following rules must be respected:

- Do not delete existing mock data.
- Do not change the business meaning of existing models.
- Do not change DashboardCalculator unless absolutely necessary.
- Do not redesign the UI.
- Do not add external packages.
- Do not change routes.
- Do not connect CSV or Excel in this version.
- Do not mix data loading logic inside UI widgets.
- Keep the dashboard page focused on presentation.
- Keep business calculations outside the UI.
- Keep data source logic behind a contract.

---

## 8. Expected Version 3 Flow

The expected final flow after Version 3 is:

DashboardPage requests a DashboardSummary from DashboardRepository.

DashboardRepository requests a DashboardDataset from DashboardDataSource.

MockDashboardDataSource loads the current mock sales and inventory data.

DashboardRepository sends the dataset to DashboardCalculator.

DashboardCalculator returns DashboardSummary.

DashboardPage displays the prepared DashboardSummary.

---

## 9. Expected New Files

The expected new files in Version 3 are:

- lib/features/dashboard/models/dashboard_dataset.dart
- lib/features/dashboard/data_sources/dashboard_data_source.dart
- lib/features/dashboard/data_sources/mock_dashboard_data_source.dart
- lib/features/dashboard/repositories/dashboard_repository.dart

---

## 10. Expected Modified Files

The expected modified file is:

- lib/features/dashboard/pages/dashboard_page.dart

This modification should happen only when repository integration begins.

---

## 11. Files That Should Remain Stable

The following files should remain stable unless a later gate explicitly allows changes:

- lib/features/dashboard/models/sale_record.dart
- lib/features/dashboard/models/inventory_item.dart
- lib/features/dashboard/data/mock_business_data.dart
- lib/features/dashboard/services/dashboard_calculator.dart
- lib/core/widgets/kpi_card.dart
- lib/features/dashboard/widgets/mini_bar_chart.dart
- lib/main.dart
- pubspec.yaml

---

## 12. Version 3 Execution Stages

Version 3 will be executed through the following stages:

- T014-V3 — Data Source Abstraction Scope Lock
- T015-V3 — Dashboard Dataset Model
- T016-V3 — Dashboard Data Source Contract
- T017-V3 — Mock Dashboard Data Source
- T018-V3 — Dashboard Repository
- T019-V3 — Dashboard Page Repository Integration
- T020-V3 — Coupling Scan and Architecture Gate
- T021-V3 — Runtime Review
- T022-V3 — Final V3 Documentation and Milestone Report

---

## 13. Gate Law

Each stage must end with:

- Small creation or modification
- No direct deletion of legacy code
- No route changes unless the stage requires it
- dart format
- flutter analyze
- tree snapshot
- change log
- gate decision

---

## 14. Success Criteria for Version 3

Version 3 is successful when:

- DashboardDataset exists.
- DashboardDataSource exists.
- MockDashboardDataSource exists.
- DashboardRepository exists.
- DashboardPage no longer directly depends on MockBusinessData.
- DashboardPage no longer directly creates DashboardCalculator.
- The dashboard still runs visually like Version 2.
- flutter analyze returns No issues found.
- The final Version 3 report is completed.

---

## 15. Final Decision for This Stage

T014-V3 locks the scope of Version 3.

No code changes are introduced in this stage.

The project is now ready to begin T015-V3 — Dashboard Dataset Model.
