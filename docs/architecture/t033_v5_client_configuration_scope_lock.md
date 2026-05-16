# T033-V5 — Client Configuration Scope Lock

## Project Name
Small Business Dashboard Starter

## Flutter Project Name
small_business_dashboard_flutter

## Milestone
Version 5

## Version 5 Title
Client Configuration

---

## 1. Purpose of Version 5

The purpose of Version 5 is to make the dashboard more configurable for different small business clients.

Version 1 proved that the dashboard works.

Version 2 improved the visual design.

Version 3 introduced data source abstraction.

Version 4 introduced CSV / Excel-compatible data support.

Version 5 will introduce a client configuration layer so that common client-specific values can be changed from one configuration location instead of being scattered inside UI or data source code.

---

## 2. Current Problem After Version 4

After Version 4, the dashboard can load data from CSV files successfully.

However, some client-specific values are still fixed in code.

Examples include:

- business name
- dashboard version label
- dashboard subtitle
- currency symbol
- top product label
- sales CSV asset path
- inventory CSV asset path

This is acceptable for a prototype, but it is not ideal for a reusable freelance dashboard starter.

If a new client wants a different business name, currency, or CSV file path, we should not edit many unrelated files manually.

---

## 3. Version 5 Main Goal

The main goal of Version 5 is to introduce a clean client configuration layer.

The intended configuration will allow the project to define:

- business name
- dashboard version label
- dashboard subtitle
- currency symbol
- top product label
- sales CSV asset path
- inventory CSV asset path

The configuration must be simple and safe.

The first implementation will use Dart-based configuration.

JSON-based configuration may be considered later, but it is not included in this version.

---

## 4. What Version 5 Will Do

Version 5 will introduce:

- ClientConfig model
- DefaultClientConfig
- header configuration integration
- currency configuration integration
- CSV asset path configuration
- repository default configuration
- client configuration coupling scan
- runtime review
- final Version 5 documentation

---

## 5. What Version 5 Will Not Do

Version 5 will not implement:

- JSON config file loading
- external configuration file picker
- external CSV file picker
- native Excel .xlsx support
- PDF export
- Excel export
- authentication
- user roles
- database configuration
- API configuration
- theme editor
- multi-client switching UI
- full unit test suite

These features are intentionally postponed to later versions.

---

## 6. Version Boundaries

Version 5 is a client configuration milestone.

It must not become an export milestone.

It must not become an authentication milestone.

It must not become an external file selection milestone.

It must not become a native Excel support milestone.

Version 5 should focus only on extracting common client-specific values into a clean configuration layer.

---

## 7. Architecture Rules for Version 5

The following rules must be respected:

- ClientConfig must not calculate dashboard metrics.
- ClientConfig must not parse CSV.
- ClientConfig must not read asset files directly.
- ClientConfig must not replace DashboardRepository.
- ClientConfig must not replace DashboardDataSource.
- DashboardCalculator must remain responsible for calculations.
- CsvDashboardDataSource must remain responsible for CSV loading and parsing.
- DashboardPage should use configuration values for client-facing text.
- DashboardPage must not know CSV parsing logic.
- No external packages should be added in this version.
- Existing CSV data support from Version 4 must remain stable.

---

## 8. Expected Version 5 Flow

The expected configuration flow is:

DefaultClientConfig
↓
DashboardPage client-facing text
↓
DashboardRepository.defaultRepository()
↓
CsvDashboardDataSource configured with asset paths
↓
CSV assets
↓
DashboardDataset
↓
DashboardCalculator
↓
DashboardSummary
↓
Dashboard UI

---

## 9. Expected New Files

The expected new files in Version 5 are:

- lib/features/dashboard/config/client_config.dart
- lib/features/dashboard/config/default_client_config.dart

---

## 10. Expected Modified Files

The expected modified files are:

- lib/features/dashboard/pages/dashboard_page.dart
- lib/features/dashboard/repositories/dashboard_repository.dart
- possibly lib/features/dashboard/data_sources/csv_dashboard_data_source.dart

These modifications should happen only through controlled micro-gates.

---

## 11. Files That Should Remain Stable

The following files should remain stable unless a later gate explicitly allows changes:

- lib/features/dashboard/models/sale_record.dart
- lib/features/dashboard/models/inventory_item.dart
- lib/features/dashboard/models/dashboard_dataset.dart
- lib/features/dashboard/models/dashboard_summary.dart
- lib/features/dashboard/services/dashboard_calculator.dart
- lib/core/widgets/kpi_card.dart
- lib/features/dashboard/widgets/mini_bar_chart.dart
- lib/main.dart
- assets/data/sales.csv
- assets/data/inventory.csv
- pubspec.yaml

---

## 12. Version 5 Execution Stages

Version 5 will be executed through the following stages:

- T033-V5 — Client Configuration Scope Lock
- T034-V5 — ClientConfig Model
- T035-V5 — Default Client Config
- T036-V5 — Header Configuration Integration
- T037-V5 — Currency Configuration Integration
- T038-V5 — CSV Asset Path Configuration
- T039-V5 — Repository Default Configuration
- T040-V5 — Client Configuration Coupling Scan
- T041-V5 — Runtime Review
- T042-V5 — Final V5 Documentation and Milestone Report

---

## 13. Gate Law

Each stage must end with:

- small creation or modification
- no direct deletion of legacy code
- no route changes unless the stage requires it
- dart format
- flutter analyze
- tree snapshot
- change log
- gate decision

---

## 14. Success Criteria for Version 5

Version 5 is successful when:

- ClientConfig exists.
- DefaultClientConfig exists.
- dashboard title comes from config.
- dashboard version label comes from config.
- dashboard subtitle comes from config.
- currency symbol comes from config.
- top product label comes from config.
- CSV asset paths can come from config.
- DashboardPage remains clean.
- DashboardPage does not parse CSV.
- DashboardPage does not read asset files directly.
- flutter analyze returns No issues found.
- runtime review passes.
- final Version 5 report is completed.

---

## 15. Final Decision for This Stage

T033-V5 locks the scope of Version 5.

No code changes are introduced in this stage.

The project is now ready to begin T034-V5 — ClientConfig Model.
