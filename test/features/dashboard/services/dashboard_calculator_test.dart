import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/models/inventory_item.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/models/sale_record.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/services/dashboard_calculator.dart';

void main() {
  group('DashboardCalculator', () {
    final calculator = DashboardCalculator();

    final sales = [
      SaleRecord(
        date: DateTime.parse('2026-01-01'),
        productName: 'Alpha Product',
        category: 'Food',
        quantity: 2,
        unitPrice: 10,
        unitCost: 6,
        branchName: 'Main Branch',
      ),
      SaleRecord(
        date: DateTime.parse('2026-01-02'),
        productName: 'Beta Product',
        category: 'Cleaning',
        quantity: 3,
        unitPrice: 5,
        unitCost: 2,
        branchName: 'Main Branch',
      ),
      SaleRecord(
        date: DateTime.parse('2026-01-03'),
        productName: 'Alpha Product',
        category: 'Food',
        quantity: 4,
        unitPrice: 10,
        unitCost: 6,
        branchName: 'Second Branch',
      ),
    ];

    final inventory = [
      InventoryItem(
        productName: 'Alpha Product',
        category: 'Food',
        currentStock: 5,
        minimumStock: 10,
      ),
      InventoryItem(
        productName: 'Beta Product',
        category: 'Cleaning',
        currentStock: 12,
        minimumStock: 5,
      ),
      InventoryItem(
        productName: 'Gamma Product',
        category: 'Stationery',
        currentStock: 1,
        minimumStock: 3,
      ),
    ];

    test('calculates sales, profit, orders, and average order value', () {
      final summary = calculator.calculate(sales: sales, inventory: inventory);

      expect(summary.totalSales, closeTo(75, 0.001));
      expect(summary.totalProfit, closeTo(33, 0.001));
      expect(summary.totalOrders, 3);
      expect(summary.averageOrderValue, closeTo(25, 0.001));
    });

    test('detects low stock count and low stock items', () {
      final summary = calculator.calculate(sales: sales, inventory: inventory);

      expect(summary.lowStockCount, 2);
      expect(
        summary.lowStockItems.map((item) => item.productName),
        containsAll(['Alpha Product', 'Gamma Product']),
      );
    });

    test('calculates top product and sales by category', () {
      final summary = calculator.calculate(sales: sales, inventory: inventory);

      expect(summary.topProductName, 'Alpha Product');

      final salesByCategory = {
        for (final item in summary.salesByCategory)
          item.category: item.totalSales,
      };

      expect(salesByCategory['Food'], closeTo(60, 0.001));
      expect(salesByCategory['Cleaning'], closeTo(15, 0.001));
    });
  });
}
