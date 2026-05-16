class SaleRecord {
  const SaleRecord({
    required this.date,
    required this.productName,
    required this.category,
    required this.quantity,
    required this.unitPrice,
    required this.unitCost,
    required this.branchName,
  });

  final DateTime date;
  final String productName;
  final String category;
  final int quantity;
  final double unitPrice;
  final double unitCost;
  final String branchName;

  double get revenue => quantity * unitPrice;

  double get cost => quantity * unitCost;

  double get profit => revenue - cost;
}
