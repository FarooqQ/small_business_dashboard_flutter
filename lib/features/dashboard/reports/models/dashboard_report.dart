import '../report_type.dart';

class DashboardReport {
  const DashboardReport({
    required this.type,
    required this.title,
    required this.fileName,
    required this.content,
    required this.createdAt,
  });

  final DashboardReportType type;
  final String title;
  final String fileName;
  final String content;
  final DateTime createdAt;
}
