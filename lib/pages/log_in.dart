import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuza/pages/components/my_button.dart';
import 'package:kuza/pages/components/my_textfield.dart';
import 'package:kuza/pages/components/normal_tf.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// Modify your signUserIn method in LoginPage
  Future<void> signUserIn(BuildContext context) async {
    try {
      // Show loading indicator
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CupertinoActivityIndicator(),
              ),
            );
          },
        );
      } else if (Platform.isAndroid) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Dismiss loading indicator
      Navigator.of(context, rootNavigator: true).pop();

      // Navigate to the home page after successful login
      Navigator.of(context).pushReplacementNamed('/HomePage');
    } on FirebaseAuthException catch (e) {
      // Dismiss loading indicator
      Navigator.of(context, rootNavigator: true).pop();

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      // Display error message using a SnackBar or showDialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uza',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // welcome back you've been missed
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Text(
                      'Welcome back to Uza',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 25,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // username textfield
                  normalTF(
                    controller: emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  // forgot password?
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Forgot Password page
                      Navigator.of(context).pushNamed('/password');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[400],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: () {
                      signUserIn(context);
                    },
                    buttonText: "Login",
                  ),

                  const SizedBox(height: 20),

                  // google + apple sign in buttons

                  // not a member register now
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 4),
                        TextButton(
                          onPressed: () {
                            // Navigate to the Register page
                            Navigator.of(context).pushNamed('/signUp');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
