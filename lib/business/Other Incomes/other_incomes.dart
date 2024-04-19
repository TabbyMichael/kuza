import 'package:flutter/material.dart';
import 'package:kuza/business/Other%20Incomes/add_other_incomes.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/other_incomes.dart';

class OtherIncomesPage extends StatefulWidget {
  const OtherIncomesPage({super.key});

  @override
  _OtherIncomesPageState createState() => _OtherIncomesPageState();
}

class _OtherIncomesPageState extends State<OtherIncomesPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late List<OtherIncome> _incomeList = [];
  late List<OtherIncome> _allIncomes = [];

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  void _loadIncomes() async {
    try {
      List<OtherIncome> incomes = await dbHelper.getOtherIncomes();
      setState(() {
        _incomeList = incomes;
        _allIncomes = incomes;
      });
    } catch (e) {
      print('Error loading other incomes: $e');
      setState(() {
        _incomeList = [];
        _allIncomes = [];
      });
    }
  }

  void _filterIncomes(String query) {
    setState(() {
      _incomeList = _allIncomes
          .where((income) =>
              income.description.toLowerCase().contains(query.toLowerCase()) ||
              income.date.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _confirmDeleteIncome(OtherIncome income) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${income.description}?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                _deleteIncome(income);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildIncomeList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _descriptionController,
            onChanged: (value) {
              _filterIncomes(value);
            },
            decoration: const InputDecoration(
              hintText: 'Search other incomes...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _incomeList.length,
            itemBuilder: (BuildContext context, int index) {
              OtherIncome income = _incomeList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: ListTile(
                  title: Text(income.description),
                  subtitle:
                      Text('Amount: ${income.amount} | Date: ${income.date}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.black),
                    onPressed: () {
                      _confirmDeleteIncome(income);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _addIncome() async {
    OtherIncome newIncome = OtherIncome(
      description: _descriptionController.text,
      amount: double.parse(_amountController.text),
      date: _dateController.text,
    );

    try {
      await dbHelper.insertOtherIncome(newIncome);
      _loadIncomes();
    } catch (e) {
      print('Error adding income: $e');
    }
  }

  void _deleteIncome(OtherIncome income) async {
    try {
      await dbHelper.deleteOtherIncome(income.id!);
      _loadIncomes();
    } catch (e) {
      print('Error deleting income: $e');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Other Incomes',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 167, 222, 248),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                // Implement menu actions
              },
            ),
          ],
        ),
        body: _incomeList.isNotEmpty
            ? _buildIncomeList(context)
            : buildEmptyMessage(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToAddIncome();
          },
          backgroundColor: const Color.fromARGB(255, 167, 222, 248),
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      );

  void _navigateToAddIncome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddOtherIncomePage(),
      ),
    ).then((_) {
      _loadIncomes();
    });
  }

  Widget buildEmptyMessage(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.16,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You don't have any other incomes.",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Click + to add some incomes",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
