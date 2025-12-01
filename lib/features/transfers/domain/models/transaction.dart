class TransactionModel {
  final String name;
  final String? dp;
  final String type;
  final String time;
  final String amount;

  const TransactionModel({
    required this.name,
    required this.type,
    required this.time,
    required this.amount,
    this.dp,
  });
}
