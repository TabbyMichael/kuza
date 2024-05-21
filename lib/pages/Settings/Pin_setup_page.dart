import 'package:flutter/material.dart';

class PasscodePinSetupPage extends StatelessWidget {
  const PasscodePinSetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passcode/Pin Setup'),
      ),
      body: Center(
        child: Text('This is the Passcode/Pin Setup Page'),
      ),
    );
  }
}
