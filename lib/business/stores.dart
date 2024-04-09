import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class Stores extends StatelessWidget {
  const Stores({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Stores',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 167, 222, 248),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your action here when the button is clicked
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      );
}
