import '../models/dashboard_dataset.dart';

abstract class DashboardDataSource {
  Future<DashboardDataset> loadDashboardDataset();
}
