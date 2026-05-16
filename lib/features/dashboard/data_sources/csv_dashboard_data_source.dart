import 'package:flutter/services.dart';

import '../models/dashboard_dataset.dart';
import '../models/inventory_item.dart';
import '../models/sale_record.dart';
import 'csv_parsing_helpers.dart';
import 'dashboard_data_source.dart';

class CsvDashboardDataSource implements DashboardDataSource {
  const CsvDashboardDataSource({
    this.salesAssetPath = 'assets/data/sales.csv',
    this.inventoryAssetPath = 'assets/data/inventory.csv',
  });

  final String salesAssetPath;
  final String inventoryAssetPath;

  @override
  Future<DashboardDataset> loadDashboardDataset() async {
    final salesCsvContent = await rootBundle.loadString(salesAssetPath);
    final inventoryCsvContent = await rootBundle.loadString(inventoryAssetPath);

    final sales = _parseSales(salesCsvContent);
    final inventory = _parseInventory(inventoryCsvContent);

    return DashboardDataset(sales: sales, inventory: inventory);
  }

  List<SaleRecord> _parseSales(String csvContent) {
    final table = CsvParsingHelpers.parseTable(csvContent);

    CsvParsingHelpers.requireColumns(
      table: table,
      requiredColumns: [
        'date',
        'product_name',
        'category',
        'quantity',
        'unit_price',
        'unit_cost',
        'branch_name',
      ],
      sourceName: salesAssetPath,
    );

    return table.rows.map((row) {
      return SaleRecord(
        date: CsvParsingHelpers.requiredDate(row, 'date'),
        productName: CsvParsingHelpers.requiredString(row, 'product_name'),
        category: CsvParsingHelpers.requiredString(row, 'category'),
        quantity: CsvParsingHelpers.requiredInt(row, 'quantity'),
        unitPrice: CsvParsingHelpers.requiredDouble(row, 'unit_price'),
        unitCost: CsvParsingHelpers.requiredDouble(row, 'unit_cost'),
        branchName: CsvParsingHelpers.requiredString(row, 'branch_name'),
      );
    }).toList();
  }

  List<InventoryItem> _parseInventory(String csvContent) {
    final table = CsvParsingHelpers.parseTable(csvContent);

    CsvParsingHelpers.requireColumns(
      table: table,
      requiredColumns: [
        'product_name',
        'category',
        'current_stock',
        'minimum_stock',
      ],
      sourceName: inventoryAssetPath,
    );

    return table.rows.map((row) {
      return InventoryItem(
        productName: CsvParsingHelpers.requiredString(row, 'product_name'),
        category: CsvParsingHelpers.requiredString(row, 'category'),
        currentStock: CsvParsingHelpers.requiredInt(row, 'current_stock'),
        minimumStock: CsvParsingHelpers.requiredInt(row, 'minimum_stock'),
      );
    }).toList();
  }
}
