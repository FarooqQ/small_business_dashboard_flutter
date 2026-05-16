# T043-V6 — Export Reports Planning

## Project Name
Small Business Dashboard Starter

## Flutter Project Name
small_business_dashboard_flutter

## Milestone
Version 6

## Version 6 Title
Export Reports

---

## 1. Purpose of Version 6

The purpose of Version 6 is to add report export capability to the dashboard.

Version 1 proved that the dashboard works.

Version 2 improved the visual design.

Version 3 introduced data source abstraction.

Version 4 introduced CSV / Excel-compatible data support.

Version 5 introduced client configuration.

Version 6 will introduce report generation and export preparation.

The goal is to help small business users extract useful dashboard information into report-friendly formats.

---

## 2. Current Problem After Version 5

After Version 5, the dashboard is configurable and reads CSV-based data successfully.

However, the information is only visible inside the dashboard UI.

A client may need to export:

- dashboard summary
- low stock report
- sales by category report
- management report
- CSV/text summary for documentation or sharing

Without export capability, the dashboard remains mostly visual and interactive, but not yet useful for formal reporting.

---

## 3. Version 6 Main Goal

The main goal of Version 6 is to create a report export foundation.

The first implementation should be simple and safe.

Version 6 should begin with text/CSV-style report generation before moving to PDF or Excel packages.

This protects the project from adding heavy dependencies too early.

---

## 4. What Version 6 Will Do

Version 6 will introduce:

- report types definition
- report model foundation
- dashboard summary report generation
- low stock report generation
- sales by category report generation
- export content builder
- simple UI entry point for reports
- runtime export review
- export architecture coupling scan
- final Version 6 documentation

---

## 5. What Version 6 Will Not Do

Version 6 will not implement in the first stage:

- PDF package integration
- native Excel export
- file picker
- save dialog
- email sending
- cloud upload
- authentication
- user roles
- advanced report designer
- chart images inside exported reports

These features may be considered in later versions.

---

## 6. Version 6 Export Strategy

The recommended strategy is:

1. Generate report content as structured text or CSV-like content.
2. Keep report generation separate from DashboardPage.
3. Keep calculation logic inside DashboardCalculator.
4. Use DashboardSummary as the source of report data.
5. Add PDF or Excel export only after the report foundation is stable.

---

## 7. Architecture Rules for Version 6

The following rules must be respected:

- DashboardPage must not calculate report data.
- DashboardPage must not build raw report content directly.
- DashboardCalculator must remain responsible for business calculations.
- Report generators may consume DashboardSummary.
- Report generators must not parse CSV.
- CsvDashboardDataSource must remain responsible for CSV loading.
- DashboardRepository must remain the coordination layer.
- ClientConfig must remain configuration only.
- No external packages should be added in the first export planning stages.
- UI changes must be small and controlled.

---

## 8. Expected Report Types

Version 6 should support planning for these report types:

- Dashboard Summary Report
- Low Stock Report
- Sales by Category Report

Optional future report types:

- Branch Sales Report
- Profit Report
- Inventory Health Report
- Monthly Sales Report

---

## 9. Expected New Files

Expected new files may include:

- lib/features/dashboard/reports/models/dashboard_report.dart
- lib/features/dashboard/reports/report_type.dart
- lib/features/dashboard/reports/dashboard_report_generator.dart
- lib/features/dashboard/reports/export_content_builder.dart

The exact files will be created gradually through micro-gates.

---

## 10. Expected Modified Files

Expected modified files may include:

- lib/features/dashboard/pages/dashboard_page.dart
- lib/features/dashboard/config/client_config.dart
- lib/features/dashboard/config/default_client_config.dart

Any UI modifications must remain small and controlled.

---

## 11. Files That Should Remain Stable

The following files should remain stable unless a later gate explicitly allows changes:

- lib/features/dashboard/models/sale_record.dart
- lib/features/dashboard/models/inventory_item.dart
- lib/features/dashboard/models/dashboard_dataset.dart
- lib/features/dashboard/models/dashboard_summary.dart
- lib/features/dashboard/services/dashboard_calculator.dart
- lib/features/dashboard/data_sources/csv_dashboard_data_source.dart
- lib/features/dashboard/data_sources/csv_parsing_helpers.dart
- lib/features/dashboard/repositories/dashboard_repository.dart
- lib/core/widgets/kpi_card.dart
- lib/features/dashboard/widgets/mini_bar_chart.dart
- lib/main.dart
- pubspec.yaml

---

## 12. Version 6 Execution Stages

Version 6 will be executed through the following stages:

- T043-V6 — Export Reports Planning
- T044-V6 — Report Types Definition
- T045-V6 — Report Model Foundation
- T046-V6 — Dashboard Report Generator
- T047-V6 — Low Stock Report Generator
- T048-V6 — Sales by Category Report Generator
- T049-V6 — Export Text/CSV Content Builder
- T050-V6 — Export UI Entry Point
- T051-V6 — Runtime Export Review
- T052-V6 — Export Architecture Coupling Scan
- T053-V6 — Final V6 Documentation and Milestone Report

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

## 14. Success Criteria for Version 6

Version 6 is successful when:

- report types are defined
- report model exists
- dashboard summary report can be generated
- low stock report can be generated
- sales by category report can be generated
- export content can be produced in text/CSV-style format
- DashboardPage remains clean
- report logic remains outside UI
- flutter analyze returns No issues found
- runtime review passes
- final Version 6 report is completed

---

## 15. Final Decision for This Stage

T043-V6 locks the scope of Version 6.

No code changes are introduced in this stage.

The project is now ready to begin T044-V6 — Report Types Definition.
