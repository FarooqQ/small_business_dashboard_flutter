import '../data/mock_business_data.dart';
import '../models/dashboard_dataset.dart';
import 'dashboard_data_source.dart';

class MockDashboardDataSource implements DashboardDataSource {
  const MockDashboardDataSource();

  @override
  Future<DashboardDataset> loadDashboardDataset() async {
    return DashboardDataset(
      sales: MockBusinessData.sales,
      inventory: MockBusinessData.inventory,
    );
  }
}
