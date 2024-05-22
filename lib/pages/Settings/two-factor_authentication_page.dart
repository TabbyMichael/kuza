import 'package:flutter/material.dart';

class TwoFactorAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Factor Authentication (2FA)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable 2FA'),
              value: false, // Implement logic to manage this state
              onChanged: (bool value) {
                // Implement 2FA enable/disable functionality
              },
            ),
            if (true) // Conditional widget rendering based on the 2FA status
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Implement 2FA setup functionality
                      },
                      child: const Text('Setup 2FA'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
