import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/models/dashboard_summary.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/models/inventory_item.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/reports/dashboard_report_generator.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/reports/report_type.dart';

void main() {
  group('DashboardReportGenerator', () {
    const generator = DashboardReportGenerator();

    final createdAt = DateTime(2026, 5, 15, 13, 7);

    final summary = DashboardSummary(
      totalSales: 100.0,
      totalProfit: 35.5,
      totalOrders: 4,
      averageOrderValue: 25.0,
      lowStockCount: 2,
      topProductName: 'Rice 5kg',
      salesByCategory: const [
        CategorySales(category: 'Food', totalSales: 75.5),
        CategorySales(category: 'Cleaning', totalSales: 24.5),
      ],
      lowStockItems: const [
        InventoryItem(
          productName: 'Tea 500g',
          category: 'Food',
          currentStock: 4,
          minimumStock: 10,
        ),
        InventoryItem(
          productName: 'Hand Soap',
          category: 'Cleaning',
          currentStock: 6,
          minimumStock: 8,
        ),
      ],
    );

    test('generates dashboard summary report', () {
      final report = generator.generateDashboardSummaryReport(
        summary,
        createdAt: createdAt,
      );

      expect(report.type, DashboardReportType.dashboardSummary);
      expect(report.title, 'Dashboard Summary Report');
      expect(report.fileName, 'dashboard_summary_report');
      expect(report.createdAt, createdAt);

      expect(report.content, contains('Dashboard Summary Report'));
      expect(report.content, contains('Business: Small Business Dashboard'));
      expect(report.content, contains('Generated At: 2026-05-15T13:07:00.000'));
      expect(report.content, contains('Total Sales: \$100.00'));
      expect(report.content, contains('Total Profit: \$35.50'));
      expect(report.content, contains('Orders: 4'));
      expect(report.content, contains('Average Order: \$25.00'));
      expect(report.content, contains('Low Stock Items: 2'));
      expect(report.content, contains('Top Product: Rice 5kg'));
    });

    test('generates low stock report', () {
      final report = generator.generateLowStockReport(
        summary,
        createdAt: createdAt,
      );

      expect(report.type, DashboardReportType.lowStock);
      expect(report.title, 'Low Stock Report');
      expect(report.fileName, 'low_stock_report');
      expect(report.createdAt, createdAt);

      expect(report.content, contains('Low Stock Report'));
      expect(report.content, contains('Business: Small Business Dashboard'));
      expect(report.content, contains('Generated At: 2026-05-15T13:07:00.000'));
      expect(report.content, contains('Total Low Stock Items: 2'));
      expect(
        report.content,
        contains('Product Name,Category,Current Stock,Minimum Stock'),
      );
      expect(report.content, contains('Tea 500g,Food,4,10'));
      expect(report.content, contains('Hand Soap,Cleaning,6,8'));
    });

    test('generates sales by category report', () {
      final report = generator.generateSalesByCategoryReport(
        summary,
        createdAt: createdAt,
      );

      expect(report.type, DashboardReportType.salesByCategory);
      expect(report.title, 'Sales by Category Report');
      expect(report.fileName, 'sales_by_category_report');
      expect(report.createdAt, createdAt);

      expect(report.content, contains('Sales by Category Report'));
      expect(report.content, contains('Business: Small Business Dashboard'));
      expect(report.content, contains('Generated At: 2026-05-15T13:07:00.000'));
      expect(report.content, contains('Category,Total Sales'));
      expect(report.content, contains('Food,\$75.50'));
      expect(report.content, contains('Cleaning,\$24.50'));
    });
  });
}
