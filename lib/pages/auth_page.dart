import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    super.initState();
    // Delay popping the page for 7 seconds after the page is fully loaded
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A verification email has been sent to ${widget.email}. Please check your email and follow the instructions to continue with the sign-up process.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
