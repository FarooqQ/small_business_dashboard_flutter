# Delivery Checklist

## Project Name
Small Business Dashboard Starter

## Document Type
Delivery Checklist

## Version
Release 1.0.0 — Freelance Delivery Package

---

## 1. Purpose

This checklist is used before delivering the Small Business Dashboard Starter project to a client.

The goal is to make sure the project is technically stable, documented, tested, and ready for handoff.

A project should not be delivered until the important items in this checklist are reviewed.

---

## 2. Project Identity Checklist

Check the following:

- [ ] Project name is correct.
- [ ] Business name is correct.
- [ ] Dashboard version label is correct.
- [ ] Dashboard subtitle is correct.
- [ ] Currency symbol is correct.
- [ ] Top Product label is correct.
- [ ] Client configuration is reviewed.

Configuration file:

lib/features/dashboard/config/default_client_config.dart

---

## 3. Data Files Checklist

Check the following:

- [ ] sales.csv exists.
- [ ] inventory.csv exists.
- [ ] sales.csv has all required columns.
- [ ] inventory.csv has all required columns.
- [ ] sales.csv contains valid data.
- [ ] inventory.csv contains valid data.
- [ ] numeric values are valid.
- [ ] date values are valid.
- [ ] product names are consistent.
- [ ] category names are consistent.

Default data paths:

assets/data/sales.csv

assets/data/inventory.csv

---

## 4. sales.csv Required Columns

The sales.csv file must include:

- [ ] date
- [ ] product_name
- [ ] category
- [ ] quantity
- [ ] unit_price
- [ ] unit_cost
- [ ] branch_name

---

## 5. inventory.csv Required Columns

The inventory.csv file must include:

- [ ] product_name
- [ ] category
- [ ] current_stock
- [ ] minimum_stock

---

## 6. Flutter Dependency Checklist

Run:

flutter pub get

Confirm:

- [ ] Dependencies resolved successfully.
- [ ] No blocking dependency errors appeared.

Notes:

Package update warnings are not always delivery blockers, but dependency errors must be fixed.

---

## 7. Formatting Checklist

Run:

dart format lib test

Confirm:

- [ ] Production code formatted.
- [ ] Test code formatted.
- [ ] No formatting errors appeared.

---

## 8. Static Analysis Checklist

Run:

flutter analyze

Expected result:

No issues found

Confirm:

- [ ] flutter analyze passed.
- [ ] No errors.
- [ ] No warnings.
- [ ] No info issues.

A project should not be delivered if flutter analyze fails.

---

## 9. Test Checklist

Run:

flutter test

Expected result:

All tests passed

Confirm:

- [ ] flutter test passed.
- [ ] DashboardCalculator tests passed.
- [ ] CsvParsingHelpers tests passed.
- [ ] ExportContentBuilder tests passed.
- [ ] DashboardReportGenerator tests passed.
- [ ] defaultClientConfig tests passed.

A project should not be delivered if flutter test fails.

---

## 10. Runtime Checklist

Run:

flutter run -d windows

Confirm:

- [ ] Application starts successfully.
- [ ] Dashboard loads successfully.
- [ ] No error screen appears.
- [ ] Loading state does not get stuck.
- [ ] No visual overflow appears.
- [ ] Window layout is acceptable.

---

## 11. Dashboard UI Checklist

Confirm the following sections appear correctly:

- [ ] Header appears.
- [ ] Business name appears.
- [ ] Version label appears.
- [ ] Subtitle appears.
- [ ] Top Product badge appears.
- [ ] KPI cards appear.
- [ ] Export Reports panel appears.
- [ ] Sales by Category panel appears.
- [ ] Low Stock Items panel appears.

---

## 12. KPI Cards Checklist

Confirm these KPI cards appear:

- [ ] Total Sales
- [ ] Total Profit
- [ ] Orders
- [ ] Average Order
- [ ] Low Stock
- [ ] Categories

Also confirm:

- [ ] Money values show the correct currency symbol.
- [ ] Non-money values do not show a currency symbol.
- [ ] KPI row alignment is visually acceptable.

---

## 13. Sales by Category Checklist

Confirm:

- [ ] Sales by Category panel appears.
- [ ] Categories are displayed.
- [ ] Bar chart appears.
- [ ] Values match the CSV data.
- [ ] No layout overflow appears.

---

## 14. Low Stock Items Checklist

Confirm:

- [ ] Low Stock Items panel appears.
- [ ] Low stock products are listed.
- [ ] Current stock is shown.
- [ ] Minimum stock is shown.
- [ ] Internal scroll works if many items exist.
- [ ] No bottom overflow appears.

---

## 15. Export Reports Checklist

Confirm these buttons appear:

- [ ] Summary
- [ ] Low Stock
- [ ] Categories

For each report button, confirm:

- [ ] Dialog opens.
- [ ] Report title appears.
- [ ] Suggested file name appears.
- [ ] Preview content appears.
- [ ] Close button works.

Current note:

The project currently supports report preview and suggested file names.

It does not yet include real file saving, PDF export, or Excel export.

---

## 16. Delivery Documentation Checklist

Confirm these files exist:

- [ ] docs/delivery/user_guide.md
- [ ] docs/delivery/installation_guide.md
- [ ] docs/delivery/client_discovery_form.md
- [ ] docs/delivery/kpi_definition_sheet.md
- [ ] docs/delivery/data_preparation_template.md
- [ ] docs/delivery/delivery_checklist.md
- [ ] docs/delivery/support_agreement_template.md
- [ ] docs/delivery/freelance_delivery_package_index.md

---

## 17. User Guide Checklist

Confirm the user guide explains:

- [ ] Dashboard purpose.
- [ ] KPI cards.
- [ ] Sales by Category.
- [ ] Low Stock Items.
- [ ] Export Reports preview.
- [ ] Required CSV files.
- [ ] Current limitations.
- [ ] Recommended client workflow.

---

## 18. Installation Guide Checklist

Confirm the installation guide explains:

- [ ] Required tools.
- [ ] Flutter setup.
- [ ] flutter pub get.
- [ ] dart format lib test.
- [ ] flutter analyze.
- [ ] flutter test.
- [ ] flutter run -d windows.
- [ ] CSV asset paths.
- [ ] Client configuration.
- [ ] Troubleshooting.

---

## 19. Client Discovery Form Checklist

Confirm the discovery form collects:

- [ ] Client information.
- [ ] Business type.
- [ ] Dashboard goals.
- [ ] Data situation.
- [ ] Sales data availability.
- [ ] Inventory data availability.
- [ ] KPI requirements.
- [ ] Currency preferences.
- [ ] Report requirements.
- [ ] Support expectations.
- [ ] Approval information.

---

## 20. KPI Definition Sheet Checklist

Confirm the KPI sheet explains:

- [ ] Total Sales.
- [ ] Total Profit.
- [ ] Orders.
- [ ] Average Order.
- [ ] Low Stock.
- [ ] Categories.
- [ ] Top Product.
- [ ] Sales by Category.
- [ ] Low Stock Items.
- [ ] Export Reports.

---

## 21. Data Preparation Template Checklist

Confirm the data preparation template explains:

- [ ] sales.csv schema.
- [ ] inventory.csv schema.
- [ ] required columns.
- [ ] correct examples.
- [ ] incorrect examples.
- [ ] Excel export to CSV.
- [ ] Google Sheets export to CSV.
- [ ] common mistakes.
- [ ] data quality checklist.

---

## 22. Scope Checklist

Confirm the client understands that the current version does not include:

- [ ] Real file saving.
- [ ] PDF export.
- [ ] Excel export.
- [ ] External CSV file picker.
- [ ] Database integration.
- [ ] Authentication.
- [ ] Cloud deployment.
- [ ] Multi-user system.
- [ ] Full ERP features.

---

## 23. Final Delivery Package Checklist

Before delivery, prepare:

- [ ] Source code.
- [ ] assets/data/sales.csv.
- [ ] assets/data/inventory.csv.
- [ ] docs/delivery folder.
- [ ] User guide.
- [ ] Installation guide.
- [ ] Client discovery form.
- [ ] KPI definition sheet.
- [ ] Data preparation template.
- [ ] Delivery checklist.
- [ ] Support agreement template.
- [ ] Freelance package index.
- [ ] Screenshots if required.
- [ ] Final milestone report if required.

---

## 24. Final Quality Gate

Before final delivery, run:

dart format lib test

flutter analyze

flutter test

Expected result:

flutter analyze: No issues found

flutter test: All tests passed

Final confirmation:

- [ ] dart format completed.
- [ ] flutter analyze passed.
- [ ] flutter test passed.
- [ ] application runs successfully.
- [ ] delivery documents are complete.

---

## 25. Delivery Approval

### Freelancer Confirmation

Name:

Date:

Signature / Confirmation:

### Client Confirmation

Name:

Date:

Signature / Confirmation:

---

## 26. Final Note

This checklist should be used before every client delivery.

It helps ensure that the project is not only working technically, but also ready to be delivered professionally.

