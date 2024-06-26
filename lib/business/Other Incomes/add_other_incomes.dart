import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/other_incomes.dart'; // Import package for date formatting

class AddOtherIncomePage extends StatefulWidget {
  const AddOtherIncomePage({super.key});

  @override
  _AddOtherIncomePageState createState() => _AddOtherIncomePageState();
}

class _AddOtherIncomePageState extends State<AddOtherIncomePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController =
      TextEditingController(); // Controller for the date text field
  late DateTime _selectedDate = DateTime.now(); // Store selected date
  late DatabaseHelper _databaseHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  Future<void> _saveOtherIncome() async {
    if (_formKey.currentState!.validate()) {
      OtherIncome newOtherIncome = OtherIncome(
        description: _descriptionController.text,
        amount: double.parse(_amountController.text),
        date: DateFormat('dd-MM-yyyy').format(_selectedDate), // Format date
      );

      try {
        // Insert the new other income into the database
        await _databaseHelper.insertOtherIncome(newOtherIncome);

        // Navigate back to the previous screen
        Navigator.pop(context);
      } catch (e) {
        // Handle database insertion error
        print('Error saving other income: $e');
        // Optionally, display an error message to the user
        // Or perform other error handling actions
      }
    }
  }

  // Function to show date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromARGB(
                  255, 167, 222, 248), // Calendar background color
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd-MM-yyyy')
            .format(_selectedDate); // Update the date text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Other Income'),
        backgroundColor: const Color.fromARGB(255, 167, 222, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Amount',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select Date',
                  ),
                  onTap: () => _selectDate(context), // Call date picker
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _saveOtherIncome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 222, 248),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
