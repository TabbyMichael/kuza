import 'package:flutter/material.dart';

class ManageConnectedAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Connected Accounts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Google Account'),
              subtitle: const Text('Connected'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Implement disconnect functionality
                },
                child: const Text('Disconnect'),
              ),
            ),
            ListTile(
              title: const Text('Facebook Account'),
              subtitle: const Text('Not Connected'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Implement connect functionality
                },
                child: const Text('Connect'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
