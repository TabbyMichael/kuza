import 'package:flutter/material.dart';
import 'package:kuza/business/Expenses/models/database_provider.dart';
import 'package:kuza/business/Expenses/widgets/all_expenses_screen/edit_all_expense.dart';
import 'package:provider/provider.dart';
import '../expense_screen/expense_card.dart';

class AllExpensesList extends StatelessWidget {
  const AllExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.expenses;
        return list.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: list.length,
                itemBuilder: (_, i) => GestureDetector(
                  onTap: () {
                    // Navigate to EditExpensePage when expense is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditExpensePage(expense: list[i]),
                      ),
                    );
                  },
                  child: ExpenseCard(list[i]),
                ),
              )
            : const Center(
                child: Text('No Entries Found'),
              );
      },
    );
  }
}
