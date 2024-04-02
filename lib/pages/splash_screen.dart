import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/brandintro');
    });

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200, // Set your desired width
              height: 200, // Set your desired height
              child: Image.asset(
                'lib/assets/shop.png',
              ),
            ),
            const SizedBox(
                height:
                    20), // Optional: Add some spacing between the logo and text
            const Text(
              'Uza',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
