# Installation Guide

## Project Name
Small Business Dashboard Starter

## Document Type
Installation Guide

## Version
Release 1.0.0 — Freelance Delivery Package

---

## 1. Purpose

This document explains how to install, run, analyze, test, and configure the Small Business Dashboard Starter project.

It is intended for:

- developers
- technical reviewers
- freelance clients with technical support
- maintainers who will run or customize the dashboard

---

## 2. Project Overview

Small Business Dashboard Starter is a Flutter / Dart desktop dashboard project.

It displays business indicators such as:

- total sales
- total profit
- orders
- average order
- low stock items
- categories
- top product
- sales by category
- report previews

The project currently reads prepared CSV files from assets and uses client configuration for common client-specific values.

---

## 3. Required Tools

Before running the project, make sure the following tools are installed:

- Flutter SDK
- Dart SDK included with Flutter
- Visual Studio Code
- Flutter extension for VS Code
- Dart extension for VS Code
- Windows desktop support for Flutter

For Windows desktop builds, Visual Studio with desktop development tools may also be required.

---

## 4. Recommended Environment

Recommended environment:

- Operating System: Windows 10 or later
- Editor: Visual Studio Code
- Framework: Flutter
- Language: Dart
- Target Device: Windows desktop

---

## 5. Project Folder

Open the project folder:

small_business_dashboard_flutter

Example path:

D:\My_Experience\FreelanceLabs\small_business_dashboard_flutter

In PowerShell:

cd D:\My_Experience\FreelanceLabs\small_business_dashboard_flutter

---

## 6. Install Dependencies

Run:

flutter pub get

This command downloads the required Flutter dependencies.

If Flutter shows messages about newer package versions, this is not necessarily an error.

The project should continue normally as long as the command completes successfully.

---

## 7. Format the Project

Run:

dart format lib test

This formats production code and test code.

---

## 8. Analyze the Project

Run:

flutter analyze

Expected result:

No issues found

If issues appear, they should be fixed before delivery.

---

## 9. Run Tests

Run:

flutter test

Expected result:

All tests passed

The current test suite protects:

- DashboardCalculator
- CsvParsingHelpers
- ExportContentBuilder
- DashboardReportGenerator
- defaultClientConfig

---

## 10. Run the Application

Run:

flutter run -d windows

Expected result:

The dashboard opens as a Windows desktop application.

The user should see:

- dashboard header
- KPI cards
- Export Reports panel
- Sales by Category panel
- Low Stock Items panel

---

## 11. Main Data Files

The dashboard currently reads CSV files from:

assets/data/sales.csv

assets/data/inventory.csv

These files are registered in pubspec.yaml.

---

## 12. sales.csv Structure

The sales.csv file should contain the following columns:

date,product_name,category,quantity,unit_price,unit_cost,branch_name

Example:

2026-05-01,Rice 5kg,Food,12,9.5,7.0,Main Branch

---

## 13. inventory.csv Structure

The inventory.csv file should contain the following columns:

product_name,category,current_stock,minimum_stock

Example:

Rice 5kg,Food,18,10

---

## 14. Client Configuration

Client-specific values are stored in:

lib/features/dashboard/config/default_client_config.dart

This file controls:

- business name
- dashboard version label
- dashboard subtitle
- currency symbol
- top product label
- sales CSV asset path
- inventory CSV asset path

Example configurable values:

businessName: 'Small Business Dashboard'

dashboardVersionLabel: 'Release 1.0.0'

currencySymbol: r'$'

salesCsvAssetPath: 'assets/data/sales.csv'

inventoryCsvAssetPath: 'assets/data/inventory.csv'

---

## 15. Changing the Business Name

To change the dashboard title, edit:

lib/features/dashboard/config/default_client_config.dart

Change:

businessName: 'Small Business Dashboard'

to another name, for example:

businessName: 'Green Market Dashboard'

After changing configuration, run:

dart format lib test
flutter analyze
flutter test
flutter run -d windows

---

## 16. Changing the Currency Symbol

To change the currency symbol, edit:

currencySymbol: r'$'

Examples:

currencySymbol: 'IQD'

currencySymbol: '€'

currencySymbol: r'$'

After changing the currency, run the quality gate again.

---

## 17. Changing CSV Asset Paths

CSV asset paths are controlled by:

salesCsvAssetPath

inventoryCsvAssetPath

Default values:

salesCsvAssetPath: 'assets/data/sales.csv'

inventoryCsvAssetPath: 'assets/data/inventory.csv'

If new CSV asset files are added, they must also be registered in pubspec.yaml.

---

## 18. pubspec.yaml Assets

The CSV files must be registered under the Flutter assets section.

Example:

flutter:
  uses-material-design: true

  assets:
    - assets/data/sales.csv
    - assets/data/inventory.csv

If pubspec.yaml is changed, run:

flutter pub get

---

## 19. Official Quality Gate

Before delivery, always run:

dart format lib test

flutter analyze

flutter test

Expected results:

flutter analyze: No issues found

flutter test: All tests passed

A delivery should not be marked as ready if either command fails.

---

## 20. Recommended Delivery Verification

Before delivering the project, verify:

- project runs on Windows
- dashboard loads successfully
- CSV data appears correctly
- KPI values are displayed
- Sales by Category appears
- Low Stock Items appears
- Export Reports panel appears
- report preview dialogs open
- flutter analyze passes
- flutter test passes

---

## 21. Current Limitations

The current project does not include:

- real file saving
- PDF export
- Excel export
- external CSV file picker
- database integration
- authentication
- cloud deployment
- multi-user access

These may be added in future versions if required.

---

## 22. Troubleshooting

### Problem: Dashboard does not load

Check:

- CSV files exist
- CSV files are registered in pubspec.yaml
- CSV columns are correct
- flutter pub get was executed

### Problem: Incorrect KPI values

Check:

- quantity is numeric
- unit_price is numeric
- unit_cost is numeric
- dates are valid
- CSV rows are correctly formatted

### Problem: flutter analyze fails

Read the analyzer output and fix the reported file and line.

### Problem: flutter test fails

Read the failing test name and check the expected behavior.

Do not ignore failed tests during delivery.

---

## 23. Final Installation Checklist

Before handoff:

- Flutter dependencies installed
- flutter pub get completed
- dart format lib test completed
- flutter analyze passed
- flutter test passed
- flutter run -d windows works
- CSV files verified
- client configuration verified
- delivery documents available

---

## 24. Final Note

This installation guide is part of the freelance delivery package.

It helps the technical receiver run, verify, and maintain the project safely.

