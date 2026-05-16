import '../models/inventory_item.dart';
import '../models/sale_record.dart';

class MockBusinessData {
  static final List<SaleRecord> sales = [
    SaleRecord(
      date: DateTime(2026, 5, 1),
      productName: 'Rice 5kg',
      category: 'Food',
      quantity: 12,
      unitPrice: 9.5,
      unitCost: 7.0,
      branchName: 'Main Branch',
    ),
    SaleRecord(
      date: DateTime(2026, 5, 1),
      productName: 'Cooking Oil',
      category: 'Food',
      quantity: 8,
      unitPrice: 6.0,
      unitCost: 4.2,
      branchName: 'Main Branch',
    ),
    SaleRecord(
      date: DateTime(2026, 5, 2),
      productName: 'Detergent',
      category: 'Cleaning',
      quantity: 10,
      unitPrice: 4.5,
      unitCost: 3.1,
      branchName: 'Main Branch',
    ),
    SaleRecord(
      date: DateTime(2026, 5, 2),
      productName: 'Shampoo',
      category: 'Personal Care',
      quantity: 6,
      unitPrice: 5.0,
      unitCost: 3.8,
      branchName: 'Main Branch',
    ),
    SaleRecord(
      date: DateTime(2026, 5, 3),
      productName: 'Rice 5kg',
      category: 'Food',
      quantity: 9,
      unitPrice: 9.5,
      unitCost: 7.0,
      branchName: 'Second Branch',
    ),
    SaleRecord(
      date: DateTime(2026, 5, 3),
      productName: 'Toothpaste',
      category: 'Personal Care',
      quantity: 14,
      unitPrice: 2.5,
      unitCost: 1.5,
      branchName: 'Second Branch',
    ),
  ];

  static const List<InventoryItem> inventory = [
    InventoryItem(
      productName: 'Rice 5kg',
      category: 'Food',
      currentStock: 18,
      minimumStock: 10,
    ),
    InventoryItem(
      productName: 'Cooking Oil',
      category: 'Food',
      currentStock: 5,
      minimumStock: 8,
    ),
    InventoryItem(
      productName: 'Detergent',
      category: 'Cleaning',
      currentStock: 7,
      minimumStock: 6,
    ),
    InventoryItem(
      productName: 'Shampoo',
      category: 'Personal Care',
      currentStock: 3,
      minimumStock: 5,
    ),
    InventoryItem(
      productName: 'Toothpaste',
      category: 'Personal Care',
      currentStock: 20,
      minimumStock: 10,
    ),
  ];
}
