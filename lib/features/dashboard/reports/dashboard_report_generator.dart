import '../config/default_client_config.dart';
import '../models/dashboard_summary.dart';
import 'models/dashboard_report.dart';
import 'report_type.dart';

class DashboardReportGenerator {
  const DashboardReportGenerator();

  DashboardReport generateDashboardSummaryReport(
    DashboardSummary summary, {
    DateTime? createdAt,
  }) {
    final reportType = DashboardReportType.dashboardSummary;
    final generatedAt = createdAt ?? DateTime.now();
    final config = defaultClientConfig;

    String money(double value) {
      return '${config.currencySymbol}${value.toStringAsFixed(2)}';
    }

    final content = StringBuffer()
      ..writeln(reportType.title)
      ..writeln('Business: ${config.businessName}')
      ..writeln('Generated At: ${generatedAt.toIso8601String()}')
      ..writeln('')
      ..writeln('Summary')
      ..writeln('Total Sales: ${money(summary.totalSales)}')
      ..writeln('Total Profit: ${money(summary.totalProfit)}')
      ..writeln('Orders: ${summary.totalOrders}')
      ..writeln('Average Order: ${money(summary.averageOrderValue)}')
      ..writeln('Low Stock Items: ${summary.lowStockCount}')
      ..writeln('Top Product: ${summary.topProductName}');

    return DashboardReport(
      type: reportType,
      title: reportType.title,
      fileName: reportType.fileName,
      content: content.toString(),
      createdAt: generatedAt,
    );
  }

  DashboardReport generateLowStockReport(
    DashboardSummary summary, {
    DateTime? createdAt,
  }) {
    final reportType = DashboardReportType.lowStock;
    final generatedAt = createdAt ?? DateTime.now();
    final config = defaultClientConfig;

    final content = StringBuffer()
      ..writeln(reportType.title)
      ..writeln('Business: ${config.businessName}')
      ..writeln('Generated At: ${generatedAt.toIso8601String()}')
      ..writeln('')
      ..writeln('Low Stock Items')
      ..writeln('Total Low Stock Items: ${summary.lowStockCount}')
      ..writeln('');

    if (summary.lowStockItems.isEmpty) {
      content.writeln('No low stock items found.');
    } else {
      content.writeln('Product Name,Category,Current Stock,Minimum Stock');

      for (final item in summary.lowStockItems) {
        content.writeln(
          '${item.productName},${item.category},${item.currentStock},${item.minimumStock}',
        );
      }
    }

    return DashboardReport(
      type: reportType,
      title: reportType.title,
      fileName: reportType.fileName,
      content: content.toString(),
      createdAt: generatedAt,
    );
  }

  DashboardReport generateSalesByCategoryReport(
    DashboardSummary summary, {
    DateTime? createdAt,
  }) {
    final reportType = DashboardReportType.salesByCategory;
    final generatedAt = createdAt ?? DateTime.now();
    final config = defaultClientConfig;

    String money(double value) {
      return '${config.currencySymbol}${value.toStringAsFixed(2)}';
    }

    final content = StringBuffer()
      ..writeln(reportType.title)
      ..writeln('Business: ${config.businessName}')
      ..writeln('Generated At: ${generatedAt.toIso8601String()}')
      ..writeln('')
      ..writeln('Sales by Category')
      ..writeln('Category,Total Sales');

    if (summary.salesByCategory.isEmpty) {
      content.writeln('No sales category data found.');
    } else {
      for (final item in summary.salesByCategory) {
        content.writeln('${item.category},${money(item.totalSales)}');
      }
    }

    return DashboardReport(
      type: reportType,
      title: reportType.title,
      fileName: reportType.fileName,
      content: content.toString(),
      createdAt: generatedAt,
    );
  }
}
