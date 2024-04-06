import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'FAQ',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(), // Navigate to the HomePage
              ));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ), // Use the back arrow icon
          ),
        ),
      );
}
