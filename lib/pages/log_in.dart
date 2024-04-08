import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
            return const Center(
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
            return const Center(
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
        const SnackBar(
          content: Text('Invalid email or password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Show loading indicator
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
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
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      }

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = authResult.user;

        // Dismiss loading indicator
        Navigator.pop(context); // Close the dialog

        // Navigate to the next screen after successful sign-in
        Navigator.of(context).pushReplacementNamed('/HomePage');
      } else {
        // Dismiss loading indicator if sign-in failed
        Navigator.pop(context); // Close the dialog

        // Handle sign-in failure
        // e.g., display an error message
      }
    } catch (error) {
      // Dismiss loading indicator if an error occurred
      Navigator.pop(context); // Close the dialog

      // Handle errors
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kuza',
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
                      'Welcome back to Kuza',
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

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
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
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16, // Adjust the font size here
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),
                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      GestureDetector(
                        onTap: () {
                          // Call the function to handle Google Sign-In
                          signInWithGoogle(context);
                        },
                        child: SizedBox(
                          width: 50, // Adjust width as needed
                          height: 150, // Adjust height as needed
                          child: Image.asset(
                              'lib/assets/google.png'), // Replace 'lib/assets/google.png' with your image path
                        ),
                      ),

                      const SizedBox(width: 25),

                      // Apple button (You can implement this later)
                      GestureDetector(
                        onTap: () {
                          // Implement Sign-In with Apple
                          // This can be done similarly to Google Sign-In
                        },
                        child: SizedBox(
                          width: 50, // Adjust width as needed
                          height: 150, // Adjust height as needed
                          child: Image.asset(
                              'lib/assets/apple.png'), // Replace 'lib/assets/apple.png' with your image path
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
