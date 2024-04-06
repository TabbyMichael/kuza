import 'package:flutter/material.dart';
import 'package:kuza/business/Expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:kuza/business/Expenses/models/database_provider.dart';

class EditExpensePage extends StatefulWidget {
  final Expense expense;

  const EditExpensePage({Key? key, required this.expense}) : super(key: key);

  @override
  _EditExpensePageState createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late TextEditingController _dateController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the expense details
    _titleController = TextEditingController(text: widget.expense.title);
    _amountController =
        TextEditingController(text: widget.expense.amount.toString());
    _dateController =
        TextEditingController(text: widget.expense.date.toString());
    _categoryController = TextEditingController(text: widget.expense.category);
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expense Details:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Get the updated values from the controllers
                String updatedTitle = _titleController.text;
                double updatedAmount = double.parse(_amountController.text);
                DateTime updatedDate = DateTime.parse(_dateController.text);
                String updatedCategory = _categoryController.text;

                // Create an updated Expense object
                Expense updatedExpense = Expense(
                  id: widget.expense.id,
                  title: updatedTitle,
                  amount: updatedAmount,
                  date: updatedDate,
                  category: updatedCategory,
                );

                // Call the updateExpense method in DatabaseProvider
                await Provider.of<DatabaseProvider>(context, listen: false)
                    .updateExpense(updatedExpense);

                // Navigate back to the previous screen after updating
                Navigator.of(context).pop();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
