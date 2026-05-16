import '../models/dashboard_summary.dart';
import '../models/inventory_item.dart';
import '../models/sale_record.dart';

class DashboardCalculator {
  DashboardSummary calculate({
    required List<SaleRecord> sales,
    required List<InventoryItem> inventory,
  }) {
    final totalSales = _calculateTotalSales(sales);
    final totalProfit = _calculateTotalProfit(sales);
    final totalOrders = sales.length;
    final averageOrderValue = totalOrders == 0 ? 0.0 : totalSales / totalOrders;
    final lowStockItems = inventory.where((item) => item.isLowStock).toList();

    return DashboardSummary(
      totalSales: totalSales,
      totalProfit: totalProfit,
      totalOrders: totalOrders,
      averageOrderValue: averageOrderValue,
      lowStockCount: lowStockItems.length,
      topProductName: _findTopProductName(sales),
      salesByCategory: _calculateSalesByCategory(sales),
      lowStockItems: lowStockItems,
    );
  }

  double _calculateTotalSales(List<SaleRecord> sales) {
    return sales.fold<double>(0, (sum, record) => sum + record.revenue);
  }

  double _calculateTotalProfit(List<SaleRecord> sales) {
    return sales.fold<double>(0, (sum, record) => sum + record.profit);
  }

  String _findTopProductName(List<SaleRecord> sales) {
    if (sales.isEmpty) {
      return 'No data';
    }

    final Map<String, int> quantityByProduct = {};

    for (final record in sales) {
      quantityByProduct.update(
        record.productName,
        (oldValue) => oldValue + record.quantity,
        ifAbsent: () => record.quantity,
      );
    }

    final sortedEntries = quantityByProduct.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.first.key;
  }

  List<CategorySales> _calculateSalesByCategory(List<SaleRecord> sales) {
    final Map<String, double> salesByCategory = {};

    for (final record in sales) {
      salesByCategory.update(
        record.category,
        (oldValue) => oldValue + record.revenue,
        ifAbsent: () => record.revenue,
      );
    }

    final result =
        salesByCategory.entries
            .map(
              (entry) =>
                  CategorySales(category: entry.key, totalSales: entry.value),
            )
            .toList()
          ..sort((a, b) => b.totalSales.compareTo(a.totalSales));

    return result;
  }
}
