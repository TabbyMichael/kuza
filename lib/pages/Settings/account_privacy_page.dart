import 'package:flutter/material.dart';

class AccountPrivacyPage extends StatelessWidget {
  const AccountPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Privacy'),
      ),
      body: Center(
        child: Text('Account Privacy Page'),
      ),
    );
  }
}
