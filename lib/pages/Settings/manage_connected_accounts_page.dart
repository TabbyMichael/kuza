import 'package:flutter/material.dart';

class ManageConnectedAccountsPage extends StatelessWidget {
  const ManageConnectedAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Connected Accounts'),
      ),
      body: Center(
        child: Text('Manage Connected Accounts Page'),
      ),
    );
  }
}
