import 'package:flutter/material.dart';

class LoginActivityPage extends StatelessWidget {
  const LoginActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Activity'),
      ),
      body: Center(
        child: Text('This is the Login Activity Page'),
      ),
    );
  }
}
