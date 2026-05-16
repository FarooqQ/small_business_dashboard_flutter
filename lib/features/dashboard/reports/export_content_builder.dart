import 'models/dashboard_report.dart';

class ExportContent {
  const ExportContent({required this.fileName, required this.content});

  final String fileName;
  final String content;
}

class ExportContentBuilder {
  const ExportContentBuilder();

  ExportContent buildTextExport(DashboardReport report) {
    final timestamp = _formatTimestamp(report.createdAt);

    return ExportContent(
      fileName: '${report.fileName}_$timestamp.txt',
      content: report.content,
    );
  }

  ExportContent buildCsvExport(DashboardReport report) {
    final timestamp = _formatTimestamp(report.createdAt);

    return ExportContent(
      fileName: '${report.fileName}_$timestamp.csv',
      content: report.content,
    );
  }

  String _formatTimestamp(DateTime value) {
    final year = value.year.toString().padLeft(4, '0');
    final month = value.month.toString().padLeft(2, '0');
    final day = value.day.toString().padLeft(2, '0');
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');

    return '$year$month${day}_$hour$minute';
  }
}
