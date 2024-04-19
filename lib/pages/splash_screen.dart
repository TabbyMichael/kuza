import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/brandintro');
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 222, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 700, // Set your desired width
              height: 700, // Set your desired height
              child: Image.asset(
                'lib/assets/Kuza__3_-removebg-preview (2).png',
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Optional: Add some spacing between the logo and text
          ],
        ),
      ),
    );
  }
}
