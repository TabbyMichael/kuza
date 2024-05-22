import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';

class PinSetupPage extends StatefulWidget {
  @override
  _PinSetupPageState createState() => _PinSetupPageState();
}

class _PinSetupPageState extends State<PinSetupPage> {
  final _pinController = TextEditingController();
  final LocalAuthentication _localAuth = LocalAuthentication();

  void _setPin() async {
    String pin = _pinController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_pin', pin);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PIN set successfully')),
    );
  }

  void _authenticateWithPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedPin = prefs.getString('user_pin');
    if (storedPin == null || storedPin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No PIN set')),
      );
      return;
    }

    bool isAuthenticated = await _localAuth.authenticate(
      localizedReason: 'Please authenticate to access the app',
    );

    if (isAuthenticated) {
      _showPinInputDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed')),
      );
    }
  }

  void _showPinInputDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter PIN'),
          content: TextField(
            keyboardType: TextInputType.number,
            obscureText: true,
            onChanged: (value) {
              if (value == _pinController.text) {
                Navigator.of(context).pop();
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildPinField(
      {required TextEditingController controller, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passcode/Pin Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPinField(
              controller: _pinController,
              label: 'Enter PIN',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setPin,
              child: const Text('Set PIN'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticateWithPin,
              child: const Text('Authenticate with PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
