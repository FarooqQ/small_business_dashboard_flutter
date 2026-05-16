# User Guide

## Project Name
Small Business Dashboard Starter

## Document Type
User Guide

## Version
Release 1.0.0 — Freelance Delivery Package

---

## 1. Introduction

Small Business Dashboard Starter is a simple dashboard application designed to help small business owners understand their sales, profit, inventory, and business health from structured CSV data.

The dashboard is designed for small shops, stores, local businesses, and early-stage business owners who need a clean overview of their business performance.

The system reads prepared data files and displays key information in a visual dashboard.

---

## 2. What This Dashboard Shows

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

## 3. Main Dashboard Header

The top section displays the business name and dashboard description.

Example:

Small Business Dashboard

Release 1.0.0 · Sales, profit, inventory, and business health overview

The business name, version label, subtitle, currency symbol, and CSV file paths are controlled through the client configuration.

---

## 4. Top Product Badge

The Top Product badge shows the best-performing product based on the available sales data.

This helps the user quickly identify the product with the strongest sales performance.

Example:

Top Product: Rice 5kg

---

## 5. KPI Cards

The dashboard contains six KPI cards.

### 5.1 Total Sales

Total Sales shows the total revenue from all sales records.

It is calculated from:

quantity × unit_price

for each sales record.

### 5.2 Total Profit

Total Profit shows estimated gross profit.

It is calculated from:

(unit_price - unit_cost) × quantity

for each sales record.

### 5.3 Orders

Orders shows the number of sales records available in the sales data.

Each row in the sales CSV file represents one sales record.

### 5.4 Average Order

Average Order shows the average revenue per sales record.

It is calculated as:

Total Sales ÷ Orders

### 5.5 Low Stock

Low Stock shows the number of products where current stock is less than or equal to the minimum stock level.

This helps the business owner know which products need attention.

### 5.6 Categories

Categories shows the number of active sales categories found in the sales data.

Example categories:

- Food
- Cleaning
- Personal Care
- Stationery

---

## 6. Sales by Category Panel

The Sales by Category panel shows revenue grouped by product category.

This helps the user understand which product categories generate the most revenue.

Example:

Food may generate more revenue than Cleaning or Stationery.

The chart is based on the sales CSV file.

---

## 7. Low Stock Items Panel

The Low Stock Items panel shows products that need restocking soon.

Each row displays:

- product name
- current stock
- minimum stock

Example:

Rice 5kg — 6 / 10

This means the current stock is 6 and the minimum required stock is 10.

If many low stock items exist, the panel supports internal scrolling.

---

## 8. Export Reports Panel

The Export Reports panel allows the user to preview report content before real file export is added.

Current report preview buttons:

- Summary
- Low Stock
- Categories

### 8.1 Summary Report

The Summary report previews the main dashboard summary, including:

- total sales
- total profit
- orders
- average order
- low stock count
- top product

### 8.2 Low Stock Report

The Low Stock report previews products that need restocking.

It includes:

- product name
- category
- current stock
- minimum stock

### 8.3 Categories Report

The Categories report previews sales grouped by category.

It includes:

- category
- total sales

---

## 9. Suggested File Names

When a report preview opens, the system displays a suggested file name.

The file name includes:

- report type
- date
- time
- file extension

Example:

dashboard_summary_report_20260515_1307.txt

This prepares the project for future real file export.

---

## 10. Data Source

The dashboard currently reads data from CSV files.

Main data files:

- sales.csv
- inventory.csv

These files are stored inside the project assets.

The system is Excel-compatible because the client can prepare data in Excel and export it as CSV.

---

## 11. What the User Should Prepare

The user should prepare two CSV files:

### sales.csv

This file contains sales records.

Expected columns:

- date
- product_name
- category
- quantity
- unit_price
- unit_cost
- branch_name

### inventory.csv

This file contains inventory records.

Expected columns:

- product_name
- category
- current_stock
- minimum_stock

---

## 12. Important Usage Notes

The dashboard depends on correctly prepared CSV data.

If the CSV data is incorrect, missing, or badly formatted, the dashboard may show incorrect values or fail to load data.

Important rules:

- Do not remove required columns.
- Use numbers for quantity, prices, and stock values.
- Use a valid date format.
- Keep product names consistent between sales and inventory files.
- Save Excel files as CSV before using them in the dashboard.

---

## 13. Current Limitations

The current version does not yet include:

- real file saving
- PDF export
- Excel export
- external file picker
- user login
- database connection
- cloud dashboard
- multi-user system

The current version focuses on a clean, test-protected, CSV-based dashboard starter.

---

## 14. Recommended Workflow for the Client

Recommended usage flow:

1. Prepare sales and inventory data in Excel.
2. Export the Excel sheets as CSV files.
3. Place the CSV files in the expected project location.
4. Run the dashboard.
5. Review KPI cards.
6. Review Sales by Category.
7. Review Low Stock Items.
8. Preview reports from the Export Reports panel.
9. Ask the developer for customization if needed.

---

## 15. What Can Be Customized

The following values can be customized:

- business name
- dashboard version label
- dashboard subtitle
- currency symbol
- top product label
- sales CSV file path
- inventory CSV file path

These values are controlled from the client configuration file.

---

## 16. Final Notes

Small Business Dashboard Starter is intended to be a reusable starting point for small business dashboard delivery.

It is not a full ERP system.

It is not a full accounting system.

It is a focused dashboard tool for reading CSV business data, calculating useful indicators, displaying them visually, and preparing report previews.


