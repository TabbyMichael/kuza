import 'package:flutter/material.dart';
import 'package:kuza/pages/components/my_button.dart';
import 'package:kuza/pages/components/normal_tf.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  // Text editing controllers
  final emailController = TextEditingController();

  // Send code method
  void sendCode() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Kuza',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 222, 248),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10), // Reduce the top margin here

                // Forgot password text
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 10),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 130, 130),
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 10),

                // Don't worry text
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 10),
                  child: Text(
                    'Please enter the email address',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 50),

                // Enter your email textfield
                normalTF(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                // Send code button
                MyButton(
                  onTap: sendCode,
                  buttonText: "Send",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
