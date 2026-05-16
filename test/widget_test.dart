import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/config/default_client_config.dart';

void main() {
  test('Default client config contains required Release 1.0.0 values', () {
    expect(defaultClientConfig.businessName, 'Small Business Dashboard');
    expect(defaultClientConfig.dashboardVersionLabel, 'Release 1.0.0');
    expect(defaultClientConfig.dashboardSubtitle, isNotEmpty);
    expect(defaultClientConfig.currencySymbol, isNotEmpty);
    expect(defaultClientConfig.topProductLabel, isNotEmpty);
    expect(defaultClientConfig.salesCsvAssetPath, isNotEmpty);
    expect(defaultClientConfig.inventoryCsvAssetPath, isNotEmpty);
  });
}
