class InventoryItem {
  const InventoryItem({
    required this.productName,
    required this.category,
    required this.currentStock,
    required this.minimumStock,
  });

  final String productName;
  final String category;
  final int currentStock;
  final int minimumStock;

  bool get isLowStock => currentStock <= minimumStock;
}
