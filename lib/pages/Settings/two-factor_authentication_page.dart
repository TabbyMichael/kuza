import 'package:flutter/material.dart';

class TwoFactorAuthPage extends StatelessWidget {
  const TwoFactorAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two-Factor Authentication (2FA)'),
      ),
      body: Center(
        child: Text('This is the Two-Factor Authentication (2FA) Page'),
      ),
    );
  }
}
