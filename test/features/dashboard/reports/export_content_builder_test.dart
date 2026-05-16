import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/reports/export_content_builder.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/reports/models/dashboard_report.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/reports/report_type.dart';

void main() {
  group('ExportContentBuilder', () {
    const builder = ExportContentBuilder();

    final report = DashboardReport(
      type: DashboardReportType.dashboardSummary,
      title: 'Dashboard Summary Report',
      fileName: 'dashboard_summary_report',
      content: 'Sample report content',
      createdAt: DateTime(2026, 5, 15, 13, 7),
    );

    test('builds text export with timestamped txt file name', () {
      final exportContent = builder.buildTextExport(report);

      expect(
        exportContent.fileName,
        'dashboard_summary_report_20260515_1307.txt',
      );
      expect(exportContent.content, 'Sample report content');
    });

    test('builds CSV export with timestamped csv file name', () {
      final exportContent = builder.buildCsvExport(report);

      expect(
        exportContent.fileName,
        'dashboard_summary_report_20260515_1307.csv',
      );
      expect(exportContent.content, 'Sample report content');
    });

    test('preserves report content without modification', () {
      final detailedReport = DashboardReport(
        type: DashboardReportType.lowStock,
        title: 'Low Stock Report',
        fileName: 'low_stock_report',
        content: 'Product Name,Current Stock\nTea 500g,4',
        createdAt: DateTime(2026, 1, 2, 3, 4),
      );

      final exportContent = builder.buildCsvExport(detailedReport);

      expect(exportContent.fileName, 'low_stock_report_20260102_0304.csv');
      expect(exportContent.content, 'Product Name,Current Stock\nTea 500g,4');
    });
  });
}
