import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/config/client_config.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/config/default_client_config.dart';

void main() {
  group('defaultClientConfig', () {
    test('is a ClientConfig instance', () {
      expect(defaultClientConfig, isA<ClientConfig>());
    });

    test('contains required dashboard identity values', () {
      expect(defaultClientConfig.businessName, 'Small Business Dashboard');
      expect(defaultClientConfig.dashboardVersionLabel, 'Release 1.0.0');
      expect(defaultClientConfig.dashboardSubtitle, isNotEmpty);
    });

    test('contains required display labels', () {
      expect(defaultClientConfig.currencySymbol, isNotEmpty);
      expect(defaultClientConfig.topProductLabel, isNotEmpty);
    });

    test('contains required CSV asset paths', () {
      expect(defaultClientConfig.salesCsvAssetPath, isNotEmpty);
      expect(defaultClientConfig.inventoryCsvAssetPath, isNotEmpty);

      expect(defaultClientConfig.salesCsvAssetPath, 'assets/data/sales.csv');
      expect(
        defaultClientConfig.inventoryCsvAssetPath,
        'assets/data/inventory.csv',
      );
    });
  });
}
