enum DashboardReportType { dashboardSummary, lowStock, salesByCategory }

extension DashboardReportTypeX on DashboardReportType {
  String get title {
    switch (this) {
      case DashboardReportType.dashboardSummary:
        return 'Dashboard Summary Report';
      case DashboardReportType.lowStock:
        return 'Low Stock Report';
      case DashboardReportType.salesByCategory:
        return 'Sales by Category Report';
    }
  }

  String get fileName {
    switch (this) {
      case DashboardReportType.dashboardSummary:
        return 'dashboard_summary_report';
      case DashboardReportType.lowStock:
        return 'low_stock_report';
      case DashboardReportType.salesByCategory:
        return 'sales_by_category_report';
    }
  }
}
