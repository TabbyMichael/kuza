import 'package:flutter/material.dart';

class LoginActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Activity'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Device 1'),
            subtitle: Text('Location: New York, USA\nLast Login: Yesterday'),
          ),
          Divider(),
          ListTile(
            title: Text('Device 2'),
            subtitle:
                Text('Location: San Francisco, USA\nLast Login: 2 days ago'),
          ),
          Divider(),
          ListTile(
            title: Text('Device 3'),
            subtitle: Text('Location: London, UK\nLast Login: 3 days ago'),
          ),
        ],
      ),
    );
  }
}
