import 'package:flutter/material.dart';

class SmsNotificationsPage extends StatelessWidget {
  const SmsNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Notifications'),
      ),
      body: Center(
        child: Text('This is the SMS Notifications Page'),
      ),
    );
  }
}
