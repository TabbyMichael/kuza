import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuza/pages/auth_page.dart';
import 'package:kuza/pages/components/my_button.dart';
import 'package:kuza/pages/components/my_textfield.dart';
import 'package:kuza/pages/components/normal_tf.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUserUp(BuildContext context) async {
    try {
      showLoadingDialog(context);

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Navigate to the verification page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VerificationPage(email: userCredential.user!.email!),
        ),
      );

      Navigator.of(context, rootNavigator: true).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing up. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
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
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                const SizedBox(height: 25),
                normalTF(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                normalTF(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 35),
                MyButton(
                  onTap: () {
                    signUserUp(context);
                  },
                  buttonText: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
