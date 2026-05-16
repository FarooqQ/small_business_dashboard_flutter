# T024-V4 — CSV Schema Definition

## Project Name
Small Business Dashboard Starter

## Milestone
Version 4

## Stage Title
CSV Schema Definition

---

## 1. Purpose

The purpose of this stage is to define the required CSV structure before creating sample CSV files or implementing CsvDashboardDataSource.

This stage protects the project from unclear or inconsistent data formats.

---

## 2. CSV Files Required

Version 4 will use two CSV files:

- sales.csv
- inventory.csv

These files will be stored later under:

assets/data/sales.csv  
assets/data/inventory.csv

---

## 3. sales.csv Schema

The sales.csv file represents sales transaction records.

### Required Columns

- date
- product_name
- category
- quantity
- unit_price
- unit_cost
- branch_name

### Column Meaning

#### date
The date of the sale.

Expected format:

YYYY-MM-DD

Example:

2026-05-01

#### product_name
The name of the sold product.

Example:

Rice 5kg

#### category
The product category.

Example:

Food

#### quantity
The sold quantity.

Expected type:

integer

Example:

12

#### unit_price
The selling price per unit.

Expected type:

decimal number

Example:

9.5

#### unit_cost
The cost per unit.

Expected type:

decimal number

Example:

7.0

#### branch_name
The branch where the sale happened.

Example:

Main Branch

---

## 4. sales.csv Example

date,product_name,category,quantity,unit_price,unit_cost,branch_name
2026-05-01,Rice 5kg,Food,12,9.5,7.0,Main Branch
2026-05-01,Cooking Oil,Food,8,6.0,4.2,Main Branch

---

## 5. inventory.csv Schema

The inventory.csv file represents current inventory status.

### Required Columns

- product_name
- category
- current_stock
- minimum_stock

### Column Meaning

#### product_name
The name of the inventory product.

Example:

Rice 5kg

#### category
The product category.

Example:

Food

#### current_stock
The current available quantity in stock.

Expected type:

integer

Example:

18

#### minimum_stock
The minimum acceptable stock level.

Expected type:

integer

Example:

10

---

## 6. inventory.csv Example

product_name,category,current_stock,minimum_stock
Rice 5kg,Food,18,10
Cooking Oil,Food,5,8

---

## 7. Data Validation Rules

The CSV reader should later respect these rules:

- Required columns must exist.
- Empty lines should be ignored.
- Quantity values must be parsed as integers.
- Stock values must be parsed as integers.
- Price and cost values must be parsed as decimal numbers.
- Date values must follow YYYY-MM-DD format.
- Invalid rows should be handled safely in a later validation stage.

---

## 8. Architecture Rules

DashboardPage must not know these CSV column names.

DashboardRepository must not parse CSV manually.

CsvDashboardDataSource or CSV helper logic will be responsible for reading and converting CSV rows.

SaleRecord and InventoryItem remain the target domain models.

---

## 9. Final Decision for This Stage

The CSV schema for Version 4 is now defined.

The project is ready for T025-V4 — Sample CSV Assets.
