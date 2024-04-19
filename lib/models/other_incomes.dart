// other_income.dart

class OtherIncome {
  final int? id;
  final String description;
  final double amount;
  final String date;

  OtherIncome({
    this.id,
    required this.description,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date,
    };
  }

  factory OtherIncome.fromMap(Map<String, dynamic> map) {
    return OtherIncome(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      date: map['date'],
    );
  }
}
