import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    _checkPin();
  }

  void _checkPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedPin = prefs.getString('user_pin');
    if (storedPin != null && storedPin.isNotEmpty) {
      _showPinInputDialog(storedPin);
    } else {
      _navigateToHome();
    }
  }

  void _showPinInputDialog(String storedPin) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String enteredPin = '';
        return AlertDialog(
          title: const Text('Enter PIN'),
          content: TextField(
            keyboardType: TextInputType.number,
            obscureText: true,
            onChanged: (value) {
              enteredPin = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (enteredPin == storedPin) {
                  Navigator.of(context).pop();
                  _navigateToHome();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect PIN')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
