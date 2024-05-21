import 'package:flutter/material.dart';

class EmailNotificationsPage extends StatelessWidget {
  const EmailNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Notifications'),
      ),
      body: Center(
        child: Text('This is the Email Notifications Page'),
      ),
    );
  }
}
