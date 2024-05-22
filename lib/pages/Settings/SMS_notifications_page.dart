import 'package:flutter/material.dart';

class SmsNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable SMS Notifications'),
              value: true, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement SMS notifications toggle functionality
              },
            ),
            SwitchListTile(
              title: const Text('Notify for Messages'),
              value: true, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement messages SMS notification toggle functionality
              },
            ),
            SwitchListTile(
              title: const Text('Notify for Mentions'),
              value: false, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement mentions SMS notification toggle functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
