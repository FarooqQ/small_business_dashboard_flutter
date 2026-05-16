# Data Preparation Template

## Project Name
Small Business Dashboard Starter

## Document Type
Data Preparation Template

## Version
Release 1.0.0 — Freelance Delivery Package

---

## 1. Purpose

This document explains how to prepare the data files required by the Small Business Dashboard Starter.

The dashboard currently depends on two CSV files:

- sales.csv
- inventory.csv

The client can prepare these files using Excel, Google Sheets, or another spreadsheet tool, then export them as CSV files.

Correct data preparation is very important because the dashboard results depend on the quality and structure of the CSV files.

---

## 2. Required Files

The dashboard requires two main data files:

### File 1
sales.csv

### File 2
inventory.csv

Both files must keep the required column names exactly as defined in this document.

---

## 3. sales.csv Purpose

The sales.csv file contains sales records.

It is used to calculate:

- Total Sales
- Total Profit
- Orders
- Average Order
- Top Product
- Sales by Category
- Categories

---

## 4. sales.csv Required Columns

The sales.csv file must contain these columns:

date,product_name,category,quantity,unit_price,unit_cost,branch_name

Do not remove these columns.

Do not rename these columns unless the application code is updated accordingly.

---

## 5. sales.csv Column Definitions

### date

The date of the sales record.

Recommended format:

YYYY-MM-DD

Example:

2026-05-01

### product_name

The product name.

Example:

Rice 5kg

### category

The product category.

Example:

Food

### quantity

The number of units sold.

This must be a number.

Example:

12

### unit_price

The selling price per unit.

This must be a number.

Example:

9.5

### unit_cost

The cost per unit.

This must be a number.

Example:

7.0

### branch_name

The branch or location name.

Example:

Main Branch

---

## 6. sales.csv Example

Example sales.csv content:

date,product_name,category,quantity,unit_price,unit_cost,branch_name
2026-05-01,Rice 5kg,Food,12,9.5,7.0,Main Branch
2026-05-01,Cooking Oil,Food,8,6.0,4.2,Main Branch
2026-05-02,Detergent,Cleaning,10,4.5,3.1,Main Branch
2026-05-03,Notebook,Stationery,15,2.0,1.2,Second Branch

---

## 7. inventory.csv Purpose

The inventory.csv file contains inventory records.

It is used to calculate:

- Low Stock
- Low Stock Items

---

## 8. inventory.csv Required Columns

The inventory.csv file must contain these columns:

product_name,category,current_stock,minimum_stock

Do not remove these columns.

Do not rename these columns unless the application code is updated accordingly.

---

## 9. inventory.csv Column Definitions

### product_name

The product name.

This should match the product name used in sales.csv when possible.

Example:

Rice 5kg

### category

The product category.

Example:

Food

### current_stock

The current available stock quantity.

This must be a number.

Example:

18

### minimum_stock

The minimum acceptable stock level.

This must be a number.

Example:

10

If current_stock is less than or equal to minimum_stock, the product will appear as low stock.

---

## 10. inventory.csv Example

Example inventory.csv content:

product_name,category,current_stock,minimum_stock
Rice 5kg,Food,18,10
Cooking Oil,Food,6,8
Detergent,Cleaning,12,6
Tea 500g,Food,4,10

---

## 11. Excel Preparation Steps

The client may prepare data in Excel.

Recommended steps:

1. Open Microsoft Excel.
2. Create one sheet for sales data.
3. Add the required sales.csv columns.
4. Fill in the sales records.
5. Save or export the sheet as CSV.
6. Create another sheet for inventory data.
7. Add the required inventory.csv columns.
8. Fill in the inventory records.
9. Save or export the sheet as CSV.
10. Give the files the correct names:
   - sales.csv
   - inventory.csv

---

## 12. Google Sheets Preparation Steps

The client may also use Google Sheets.

Recommended steps:

1. Create a new spreadsheet.
2. Add the required columns.
3. Fill in the records.
4. Go to File.
5. Choose Download.
6. Choose Comma Separated Values (.csv).
7. Rename the downloaded file if needed.

---

## 13. Important Formatting Rules

Follow these rules carefully:

- Keep column names exactly the same.
- Do not add spaces inside column names.
- Do not remove required columns.
- Use numbers for quantity, prices, and stock values.
- Use valid dates.
- Keep product names consistent.
- Keep category names consistent.
- Avoid empty required values.
- Save the file as CSV, not XLSX.

---

## 14. Correct Date Format

Recommended date format:

YYYY-MM-DD

Correct examples:

2026-05-01
2026-06-15
2026-12-30

Incorrect examples:

01/05/2026
May 1, 2026
2026.05.01

---

## 15. Correct Number Format

Use plain numbers.

Correct examples:

12
9.5
7.0
100

Incorrect examples:

twelve
9,5
$9.5
IQD 9000

Currency symbols should not be added inside numeric fields.

The dashboard already displays the configured currency symbol.

---

## 16. Handling Product Names with Commas

If a product name contains a comma, put the value inside double quotes.

Correct example:

2026-05-01,"Rice, Premium 5kg",Food,10,11.0,8.0,Main Branch

This prevents the comma from being treated as a column separator.

---

## 17. Common Mistakes to Avoid

Avoid these mistakes:

- changing column names
- deleting required columns
- using text instead of numbers
- using invalid dates
- mixing category names
- leaving important cells empty
- saving the file as .xlsx instead of .csv
- adding currency symbols inside price fields
- adding extra commas without quotes
- using different product names for the same product

---

## 18. Data Quality Checklist

Before sending the data, check:

- sales.csv exists
- inventory.csv exists
- all required sales columns exist
- all required inventory columns exist
- quantity values are numeric
- unit_price values are numeric
- unit_cost values are numeric
- current_stock values are numeric
- minimum_stock values are numeric
- dates are valid
- product names are consistent
- category names are consistent
- files are saved as CSV

---

## 19. Where the Files Are Used

The default project reads files from:

assets/data/sales.csv

assets/data/inventory.csv

These paths can be configured in:

lib/features/dashboard/config/default_client_config.dart

If new file names or paths are used, the project configuration and pubspec.yaml may need to be updated.

---

## 20. Client Responsibility

The client is responsible for providing accurate and complete data.

The dashboard calculations depend on the data provided.

If the data is incorrect, the dashboard results may also be incorrect.

---

## 21. Developer Responsibility

The developer is responsible for:

- checking file structure
- checking required columns
- running the project
- running quality gates
- helping the client understand formatting problems
- confirming that the dashboard loads the provided data correctly

---

## 22. Final Note

This template should be shared with the client before data collection.

It helps reduce errors and makes the delivery process faster, clearer, and more professional.

