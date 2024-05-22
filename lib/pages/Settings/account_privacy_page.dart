import 'package:flutter/material.dart';

class AccountPrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Privacy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Private Account'),
              value: true, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement private account toggle functionality
              },
            ),
            SwitchListTile(
              title: Text('Show Activity Status'),
              value: false, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement activity status toggle functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
