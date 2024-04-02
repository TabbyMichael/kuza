import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kuza/pages/brand_intro.dart';
import 'package:kuza/pages/forgot_password.dart';
import 'package:kuza/pages/home_page.dart';
import 'package:kuza/pages/log_in.dart';
import 'package:kuza/pages/sign_up.dart';
import 'package:kuza/pages/splash_screen.dart';
import 'package:kuza/pages/successful_password.dart';
import 'package:kuza/pages/verification_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedFast',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/HomePage': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        // '/invent': (context) => InventoryPage(),
        '/password': (context) => ForgotPassword(),
        '/success': (context) => const SuccessfulPassword(),
        '/verify': (context) => const VerificationPage(),
        '/brandintro': (context) => const BrandIntroPage(),
      },
    );
  }
}
