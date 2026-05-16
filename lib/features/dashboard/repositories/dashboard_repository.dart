import '../config/default_client_config.dart';
import '../data_sources/csv_dashboard_data_source.dart';
import '../data_sources/dashboard_data_source.dart';
import '../data_sources/mock_dashboard_data_source.dart';
import '../models/dashboard_summary.dart';
import '../services/dashboard_calculator.dart';

class DashboardRepository {
  const DashboardRepository({
    required DashboardDataSource dataSource,
    required DashboardCalculator calculator,
  }) : _dataSource = dataSource,
       _calculator = calculator;

  factory DashboardRepository.mock() {
    return DashboardRepository(
      dataSource: const MockDashboardDataSource(),
      calculator: DashboardCalculator(),
    );
  }

  factory DashboardRepository.defaultRepository() {
    final config = defaultClientConfig;

    return DashboardRepository.csv(
      salesAssetPath: config.salesCsvAssetPath,
      inventoryAssetPath: config.inventoryCsvAssetPath,
    );
  }

  factory DashboardRepository.csv({
    String salesAssetPath = 'assets/data/sales.csv',
    String inventoryAssetPath = 'assets/data/inventory.csv',
  }) {
    return DashboardRepository(
      dataSource: CsvDashboardDataSource(
        salesAssetPath: salesAssetPath,
        inventoryAssetPath: inventoryAssetPath,
      ),
      calculator: DashboardCalculator(),
    );
  }

  final DashboardDataSource _dataSource;
  final DashboardCalculator _calculator;

  Future<DashboardSummary> loadDashboardSummary() async {
    final dataset = await _dataSource.loadDashboardDataset();

    return _calculator.calculate(
      sales: dataset.sales,
      inventory: dataset.inventory,
    );
  }
}
