import 'inventory_item.dart';
import 'sale_record.dart';

class DashboardDataset {
  const DashboardDataset({required this.sales, required this.inventory});

  final List<SaleRecord> sales;
  final List<InventoryItem> inventory;
}
