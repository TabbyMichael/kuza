import 'package:flutter/material.dart';
import '../widgets/expense_screen/expense_fetcher.dart';

class ExpenseScreen extends StatelessWidget {
  final String categoryName;

  const ExpenseScreen({super.key, required this.categoryName});

  static const name = '/expense_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Screen - $categoryName')),
      body: ExpenseFetcher(categoryName),
    );
  }
}
