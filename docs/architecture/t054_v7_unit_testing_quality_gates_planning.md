# T054-V7 — Unit Testing and Quality Gates Planning

## Project Name
Small Business Dashboard Starter

## Flutter Project Name
small_business_dashboard_flutter

## Milestone
Version 7

## Version 7 Title
Unit Testing and Quality Gates

---

## 1. Purpose of Version 7

The purpose of Version 7 is to protect the dashboard project with unit tests and formal quality gates.

Version 1 proved that the dashboard works.

Version 2 improved the visual design.

Version 3 introduced data source abstraction.

Version 4 introduced CSV / Excel-compatible data support.

Version 5 introduced client configuration.

Version 6 introduced export reports foundation.

Version 7 will introduce testing and quality gates to make the project safer before adding heavier future features.

---

## 2. Current Problem After Version 6

After Version 6, the project has several working parts:

- dashboard calculations
- CSV parsing
- CSV-based data loading
- client configuration
- report generation
- export content preparation
- report preview UI

However, most validation is still manual.

The current quality process mostly depends on:

- dart format
- flutter analyze
- manual runtime review
- visual inspection

This is useful, but not enough as the project grows.

Version 7 adds automated tests to protect important logic.

---

## 3. Version 7 Main Goal

The main goal of Version 7 is to introduce a unit testing foundation and formal quality gates.

After Version 7, future project stages should pass:

- dart format
- flutter analyze
- flutter test
- architecture scan
- tree snapshot
- change log
- gate decision

---

## 4. What Version 7 Will Do

Version 7 will introduce:

- test folder structure
- DashboardCalculator unit tests
- CsvParsingHelpers unit tests
- ExportContentBuilder unit tests
- DashboardReportGenerator unit tests
- defaultClientConfig unit tests
- quality gate command documentation
- test architecture coupling scan
- final quality gate review
- final Version 7 documentation

---

## 5. What Version 7 Will Not Do

Version 7 will not implement:

- new dashboard features
- new KPI cards
- new CSV schema
- external CSV file picker
- native Excel support
- real file saving
- PDF export
- Excel export
- authentication
- user roles
- GitHub release
- CI/CD automation
- golden UI tests
- full integration tests
- end-to-end tests
- performance tests

These features may be considered in later versions.

---

## 6. Version 7 Testing Strategy

Version 7 will begin with unit tests.

The testing strategy is:

1. Test pure business logic first.
2. Test CSV parsing helpers.
3. Test export content builders.
4. Test report generators.
5. Test default configuration.
6. Keep UI tests and integration tests for later versions.

This strategy keeps Version 7 focused and safe.

---

## 7. Target Areas for Testing

### DashboardCalculator

Target file:

- lib/features/dashboard/services/dashboard_calculator.dart

Expected test file:

- test/features/dashboard/services/dashboard_calculator_test.dart

Expected tests:

- total sales calculation
- total profit calculation
- total orders calculation
- average order calculation
- low stock count
- top product
- sales by category aggregation
- low stock item detection

---

### CsvParsingHelpers

Target file:

- lib/features/dashboard/data_sources/csv_parsing_helpers.dart

Expected test file:

- test/features/dashboard/data_sources/csv_parsing_helpers_test.dart

Expected tests:

- parse valid CSV
- ignore empty lines
- validate required columns
- parse required string
- parse required int
- parse required double
- parse required date
- reject invalid int
- reject invalid double
- reject invalid date
- handle quoted CSV values

---

### ExportContentBuilder

Target file:

- lib/features/dashboard/reports/export_content_builder.dart

Expected test file:

- test/features/dashboard/reports/export_content_builder_test.dart

Expected tests:

- build text export
- build CSV export
- preserve content
- generate expected file name
- generate timestamp-based file name

---

### DashboardReportGenerator

Target file:

- lib/features/dashboard/reports/dashboard_report_generator.dart

Expected test file:

- test/features/dashboard/reports/dashboard_report_generator_test.dart

Expected tests:

- generate dashboard summary report
- generate low stock report
- generate sales by category report
- include report title
- include business name
- include generated date
- include expected content
- use configured currency symbol

---

### DefaultClientConfig

Target files:

- lib/features/dashboard/config/client_config.dart
- lib/features/dashboard/config/default_client_config.dart

Expected test file:

- test/features/dashboard/config/default_client_config_test.dart

Expected tests:

- business name is not empty
- version label is not empty
- subtitle is not empty
- currency symbol is not empty
- top product label is not empty
- sales CSV path is not empty
- inventory CSV path is not empty

---

## 8. Version 7 Execution Stages

Version 7 will be executed through the following stages:

- T054-V7 — Unit Testing and Quality Gates Planning
- T055-V7 — Test Folder Foundation
- T056-V7 — DashboardCalculator Unit Tests
- T057-V7 — CsvParsingHelpers Unit Tests
- T058-V7 — ExportContentBuilder Unit Tests
- T059-V7 — DashboardReportGenerator Unit Tests
- T060-V7 — ClientConfig Unit Tests
- T061-V7 — Quality Gate Commands Documentation
- T062-V7 — Test Architecture Coupling Scan
- T063-V7 — Final Quality Gate Review
- T064-V7 — Final V7 Documentation and Milestone Report

---

## 9. Version 7 Quality Gate Law

Each stage in Version 7 must end with:

- small creation or modification
- no direct deletion of legacy code
- no route changes unless the stage requires it
- dart format lib test
- flutter analyze
- flutter test
- tree snapshot
- change log
- gate decision

---

## 10. Standard Quality Gate Commands

The standard commands after Version 7 begins are:

dart format lib test

flutter analyze

flutter test

tree lib /F > docs/architecture/<stage_name>_lib_tree.txt

tree test /F > docs/architecture/<stage_name>_test_tree.txt

---

## 11. Architecture Rules for Version 7

The following rules must be respected:

- Unit tests should focus on logic, not UI rendering.
- Tests should not depend on manual visual inspection.
- Tests should use small predictable sample data.
- Tests should avoid real file saving.
- Tests should avoid external packages unless explicitly planned.
- Tests should not change production logic only to make tests pass.
- Tests should protect existing behavior.
- Quality gates should be documented after each stage.

---

## 12. Success Criteria for Version 7

Version 7 is successful when:

- test folder structure exists.
- DashboardCalculator tests exist.
- CsvParsingHelpers tests exist.
- ExportContentBuilder tests exist.
- DashboardReportGenerator tests exist.
- defaultClientConfig tests exist.
- flutter analyze returns No issues found.
- flutter test passes.
- architecture scans are documented.
- final Version 7 report is completed.

---

## 13. Final Decision for This Stage

T054-V7 locks the scope of Version 7.

No code changes are introduced in this stage.

The project is now ready to begin T055-V7 — Test Folder Foundation.
