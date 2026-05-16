# KPI Definition Sheet

## Project Name
Small Business Dashboard Starter

## Document Type
KPI Definition Sheet

## Version
Release 1.0.0 — Freelance Delivery Package

---

## 1. Purpose

This document explains the key performance indicators used in the Small Business Dashboard Starter.

The goal is to help the client understand what each KPI means, where the data comes from, how it is calculated, and how it can support business decisions.

---

## 2. Data Sources Used by KPIs

The dashboard currently uses two CSV files:

### sales.csv

Used for sales, revenue, profit, orders, average order, top product, and category analysis.

Expected columns:

- date
- product_name
- category
- quantity
- unit_price
- unit_cost
- branch_name

### inventory.csv

Used for stock and low stock analysis.

Expected columns:

- product_name
- category
- current_stock
- minimum_stock

---

## 3. KPI 1 — Total Sales

### Meaning

Total Sales shows the total revenue generated from all sales records.

### Data Source

sales.csv

### Required Columns

- quantity
- unit_price

### Calculation

quantity × unit_price

for each sales record, then all values are summed.

### Example

If a product sells 10 units at 5.00 each:

10 × 5.00 = 50.00

### Business Use

This KPI helps the business owner understand total revenue performance.

### Notes

This is revenue, not profit.

---

## 4. KPI 2 — Total Profit

### Meaning

Total Profit shows estimated gross profit from all sales records.

### Data Source

sales.csv

### Required Columns

- quantity
- unit_price
- unit_cost

### Calculation

(unit_price - unit_cost) × quantity

for each sales record, then all values are summed.

### Example

If a product sells 10 units:

unit_price = 5.00

unit_cost = 3.00

Profit:

(5.00 - 3.00) × 10 = 20.00

### Business Use

This KPI helps the business owner understand whether sales are generating enough profit.

### Notes

This is estimated gross profit only.

It does not include rent, salaries, taxes, electricity, delivery cost, or other expenses.

---

## 5. KPI 3 — Orders

### Meaning

Orders shows the number of sales records available in the sales file.

### Data Source

sales.csv

### Required Data

Each row in sales.csv is treated as one sales record.

### Calculation

Count all sales rows.

### Business Use

This KPI helps the business owner understand sales activity volume.

### Notes

In the current system, one row equals one sales record.

If one row contains aggregated sales, the Orders number represents records, not necessarily individual customer invoices.

---

## 6. KPI 4 — Average Order

### Meaning

Average Order shows the average revenue per sales record.

### Data Source

sales.csv

### Required KPIs

- Total Sales
- Orders

### Calculation

Total Sales ÷ Orders

### Example

If:

Total Sales = 500

Orders = 10

Average Order = 50

### Business Use

This KPI helps the business owner understand the average value of each sales record.

### Notes

If Orders is zero, the dashboard should avoid division errors.

---

## 7. KPI 5 — Low Stock

### Meaning

Low Stock shows how many products need restocking attention.

### Data Source

inventory.csv

### Required Columns

- current_stock
- minimum_stock

### Calculation

A product is considered low stock when:

current_stock <= minimum_stock

The KPI counts all products matching this condition.

### Example

If:

current_stock = 4

minimum_stock = 10

Then the product is considered low stock.

### Business Use

This KPI helps the business owner identify inventory risk and avoid product shortages.

### Notes

The accuracy depends on correct inventory data.

---

## 8. KPI 6 — Categories

### Meaning

Categories shows the number of active sales categories found in the sales data.

### Data Source

sales.csv

### Required Column

- category

### Calculation

Count unique category names in sales data.

### Example

If sales data contains:

- Food
- Cleaning
- Personal Care
- Stationery

Then Categories = 4

### Business Use

This KPI helps the business owner understand the variety of active sales groups.

### Notes

Category names should be consistent.

For example, Food and food may be treated as different values depending on implementation.

---

## 9. Top Product

### Meaning

Top Product shows the product with the strongest sales performance.

### Data Source

sales.csv

### Required Columns

- product_name
- quantity
- unit_price

### Calculation

The dashboard aggregates sales by product and identifies the product with the highest total sales.

### Business Use

This helps the client identify the product that contributes most to revenue.

### Notes

Top Product is based on sales value, not necessarily quantity sold.

---

## 10. Sales by Category

### Meaning

Sales by Category shows total sales grouped by product category.

### Data Source

sales.csv

### Required Columns

- category
- quantity
- unit_price

### Calculation

For each category:

quantity × unit_price

Then values are grouped and summed by category.

### Business Use

This helps the business owner identify which categories generate the most revenue.

### Notes

This is useful for product planning, promotions, and inventory focus.

---

## 11. Low Stock Items

### Meaning

Low Stock Items shows the actual products that need restocking.

### Data Source

inventory.csv

### Required Columns

- product_name
- category
- current_stock
- minimum_stock

### Calculation

Show products where:

current_stock <= minimum_stock

### Business Use

This helps the business owner know exactly which products need purchasing or restocking.

### Notes

The panel supports scrolling when many low stock items exist.

---

## 12. Export Reports

### Meaning

Export Reports allows the user to preview report content.

Current reports:

- Dashboard Summary Report
- Low Stock Report
- Sales by Category Report

### Data Source

The reports use the already calculated dashboard summary data.

### Business Use

This helps the user review information in report-style format.

### Notes

The current version supports report preview and suggested file names.

Real file saving, PDF export, and Excel export are not included in the current version.

---

## 13. KPI Accuracy Requirements

For accurate KPIs, the client should ensure:

- product names are consistent
- categories are consistent
- quantity values are numeric
- unit_price values are numeric
- unit_cost values are numeric
- current_stock values are numeric
- minimum_stock values are numeric
- dates are valid
- required CSV columns are not removed

---

## 14. Client Notes

The dashboard is only as accurate as the data provided.

If data is incomplete, inconsistent, or outdated, the dashboard results may also be inaccurate.

Before delivery, the client should review the CSV files carefully.

---

## 15. Final Summary

This KPI Definition Sheet explains the meaning and calculation logic behind the dashboard indicators.

It should be shared with the client so that the client understands what each number means and how to prepare better data for better results.

