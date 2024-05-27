import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class AddStorePage extends StatelessWidget {
  const AddStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Store',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(
              255, 167, 222, 248), // Same color as Stores page
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pop(); // Navigate back when the leading icon is tapped
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Store Name', // Label above the text field
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Spacer between label and text field
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Rectangular border
                ),
              ),
              const SizedBox(height: 20), // Spacer between text fields
              const Text(
                'Store Address', // Label above the text field
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Spacer between label and text field
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Rectangular border
                ),
              ),
              const SizedBox(height: 20), // Spacer between text fields
              ElevatedButton(
                onPressed: () {
                  // Add your action here when the button is clicked
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    'Add Store',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
