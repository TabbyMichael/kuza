import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuza/business/Expenses/models/ex_category.dart';
import 'package:kuza/business/Expenses/screens/expense_screen.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;

  const CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExpenseScreen(categoryName: category.title),
        ));
      },
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      trailing: Text(
        NumberFormat.currency(locale: 'en_IN', symbol: 'Ksh')
            .format(category.totalAmount),
      ),
    );
  }
}
