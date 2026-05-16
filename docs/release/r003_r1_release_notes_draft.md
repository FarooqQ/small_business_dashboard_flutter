# R003-R1 — Release Notes Draft

## Project Name
Small Business Dashboard Starter

## Release Name
Small Business Dashboard Starter — Release 1.0.0

## Release Track
R1

## Public Release Version
1.0.0

## Release Type
Public/Freelance Release

## Release Status
Draft

---

## 1. Release Summary

Small Business Dashboard Starter — Release 1.0.0 is the first official public/freelance release of the project.

This release transforms the project from an internal engineering build into a freelance-ready dashboard starter package.

It includes a working Flutter desktop dashboard, CSV-based data support, client configuration, report preview foundation, automated unit tests, quality gates, and delivery documentation.

---

## 2. Important Versioning Note

Versions V1 to V8 represent the internal engineering evolution of the project.

They are not public market releases.

Release 1.0.0 is the first official release prepared for client presentation, freelance delivery, portfolio usage, or future public documentation.

Therefore:

V8 is the final internal development milestone.

Release 1.0.0 is the first real public/freelance release.

---

## 3. What Is Included

Release 1.0.0 includes:

- Flutter desktop dashboard
- polished dashboard UI
- CSV / Excel-compatible data support
- sales.csv support
- inventory.csv support
- client configuration
- configurable business name
- configurable dashboard subtitle
- configurable version label
- configurable currency symbol
- configurable CSV asset paths
- KPI cards
- Sales by Category panel
- Low Stock Items panel
- Export Reports preview panel
- Dashboard Summary report preview
- Low Stock report preview
- Sales by Category report preview
- suggested export file names
- unit tests
- formal quality gates
- freelance delivery documentation

---

## 4. Main Dashboard Features

The dashboard currently displays:

- Total Sales
- Total Profit
- Orders
- Average Order
- Low Stock
- Categories
- Top Product
- Sales by Category
- Low Stock Items
- Export Reports preview

---

## 5. Report Preview Features

Release 1.0.0 includes report preview support for:

- Dashboard Summary Report
- Low Stock Report
- Sales by Category Report

The current release shows report content inside preview dialogs and prepares suggested file names.

Real file saving is not included in this release.

---

## 6. Data Support

The dashboard uses CSV files as its data source.

Default files:

- assets/data/sales.csv
- assets/data/inventory.csv

The project is Excel-compatible because a client can prepare data in Excel and export it as CSV.

---

## 7. Quality and Testing Status

Release 1.0.0 includes automated unit tests for:

- DashboardCalculator
- CsvParsingHelpers
- ExportContentBuilder
- DashboardReportGenerator
- defaultClientConfig

Official quality gate:

dart format lib test

flutter analyze

flutter test

Required release result:

- flutter analyze: No issues found
- flutter test: All tests passed

---

## 8. Delivery Documentation Included

Release 1.0.0 includes the following delivery documents:

- User Guide
- Installation Guide
- Client Discovery Form
- KPI Definition Sheet
- Data Preparation Template
- Delivery Checklist
- Support Agreement Template
- Freelance Delivery Package Index

These documents are located in:

docs/delivery

---

## 9. Release Documentation Included

Release-related documentation is located in:

docs/release

Current release documents include:

- Release 1.0.0 Preparation
- Release Metadata Document
- Release Notes Draft

---

## 10. What Is Not Included

Release 1.0.0 does not include:

- real file saving
- PDF export
- Excel export
- external CSV file picker
- native Excel reading
- database integration
- authentication
- user roles
- cloud deployment
- web deployment
- multi-user system
- full ERP system
- SaaS billing
- payment system

These items may be planned as future releases or separate paid phases.

---

## 11. Known Limitations

Current limitations:

- report export is preview-only
- CSV files must be prepared correctly
- CSV files are loaded from project assets
- there is no external CSV file selection
- there is no database
- there is no login system
- there is no real PDF or Excel export
- this is not a full ERP system

---

## 12. Recommended Use Cases

Release 1.0.0 is suitable for:

- freelance portfolio demonstration
- small business dashboard demo
- client presentation
- reusable dashboard starter
- CSV-based business reporting prototype
- foundation for future client-specific dashboard customization

---

## 13. Recommended Future Upgrades

Possible future upgrades include:

- Release 1.0.1 — documentation corrections or small bug fixes
- Release 1.1.0 — small feature additions
- Release 2.0.0 — major product or architecture upgrade

Possible future features:

- real CSV export
- PDF report export
- Excel report export
- external CSV file picker
- native Excel support
- database integration
- authentication
- web version
- SaaS transformation

---

## 14. Final Release Notes Decision

Small Business Dashboard Starter — Release 1.0.0 is ready to be described as the first official public/freelance release candidate.

This release preserves the internal V1 to V8 engineering history while presenting a clean public release identity to clients and portfolio viewers.
