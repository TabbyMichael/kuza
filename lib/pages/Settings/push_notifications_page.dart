import 'package:flutter/material.dart';

class PushNotificationsPage extends StatelessWidget {
  const PushNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: Center(
        child: Text('This is the Push Notifications Page'),
      ),
    );
  }
}
