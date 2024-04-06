import 'package:flutter/material.dart';
import '../widgets/expense_screen/expense_fetcher.dart';

class ExpenseScreen extends StatelessWidget {
  final String categoryName;

  const ExpenseScreen({Key? key, required this.categoryName}) : super(key: key);

  static const name = '/expense_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Screen - $categoryName')),
      body: ExpenseFetcher(categoryName),
    );
  }
}
