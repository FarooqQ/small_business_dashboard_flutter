import 'inventory_item.dart';

class CategorySales {
  const CategorySales({required this.category, required this.totalSales});

  final String category;
  final double totalSales;
}

class DashboardSummary {
  const DashboardSummary({
    required this.totalSales,
    required this.totalProfit,
    required this.totalOrders,
    required this.averageOrderValue,
    required this.lowStockCount,
    required this.topProductName,
    required this.salesByCategory,
    required this.lowStockItems,
  });

  final double totalSales;
  final double totalProfit;
  final int totalOrders;
  final double averageOrderValue;
  final int lowStockCount;
  final String topProductName;
  final List<CategorySales> salesByCategory;
  final List<InventoryItem> lowStockItems;
}
