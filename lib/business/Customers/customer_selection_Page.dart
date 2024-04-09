import 'package:flutter/material.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/customers.dart';

class CustomerSelectionPage extends StatefulWidget {
  @override
  _CustomerSelectionPageState createState() => _CustomerSelectionPageState();
}

class _CustomerSelectionPageState extends State<CustomerSelectionPage> {
  late DatabaseHelper _databaseHelper;
  late List<Customer> _customerList = [];
  late List<bool> _selectedCustomers = [];

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _fetchCustomers();
  }

  Future<void> _fetchCustomers() async {
    List<Customer> customers = await _databaseHelper.getCustomers();
    setState(() {
      _customerList = customers;
      _selectedCustomers =
          List<bool>.generate(customers.length, (index) => false);
    });
  }

  void _onCustomerSelected(int index, bool selected) {
    setState(() {
      _selectedCustomers[index] = selected;
    });
  }

  void _onSaveSelectedCustomers() {
    List<Customer> selectedCustomers = [];
    for (int i = 0; i < _selectedCustomers.length; i++) {
      if (_selectedCustomers[i]) {
        selectedCustomers.add(_customerList[i]);
      }
    }
    // Do something with selectedCustomers
    Navigator.pop(context, selectedCustomers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Customers'),
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 167, 222, 248),
        actions: [
          IconButton(
            onPressed: _onSaveSelectedCustomers,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _customerList.length,
        itemBuilder: (BuildContext context, int index) {
          Customer customer = _customerList[index];
          return CheckboxListTile(
            title: Text(customer.name),
            subtitle: Text(customer.contactNo),
            value: _selectedCustomers[index],
            onChanged: (bool? value) {
              _onCustomerSelected(index, value ?? false);
            },
          );
        },
      ),
    );
  }
}
