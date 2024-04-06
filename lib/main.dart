import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kuza/business/Expenses/models/database_provider.dart';
import 'package:kuza/business/Expenses/screens/all_expenses.dart';
import 'package:kuza/business/Point%20of%20sale%20(POS)/cart_model.dart';
import 'package:kuza/pages/brand_intro.dart';
import 'package:kuza/pages/forgot_password.dart';
import 'package:kuza/pages/home_page.dart';
import 'package:kuza/pages/log_in.dart';
import 'package:kuza/pages/sign_up.dart';
import 'package:kuza/pages/splash_screen.dart';
import 'package:kuza/pages/successful_password.dart';
import 'package:kuza/pages/verification_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        // Add your DatabaseProvider here
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedFast',
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/HomePage': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/signUp': (context) => SignUpPage(),
          '/password': (context) => ForgotPassword(),
          '/success': (context) => const SuccessfulPassword(),
          '/verify': (context) => const VerificationPage(),
          '/brandintro': (context) => const BrandIntroPage(),
          '/all_expenses': (context) => AllExpenses(),
        },
      ),
    );
  }
}
