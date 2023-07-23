import 'package:delivery_app/pages/authPage.dart';
import 'package:delivery_app/pages/loginPage.dart';
import 'package:delivery_app/pages/homePage.dart';
import 'package:delivery_app/pages/registrationPage.dart';
import 'package:delivery_app/pages/registrationSuccess.dart';
import 'package:delivery_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: AuthPage(),
      // home: RegistrationPage(),
      // initialRoute: AppRoutes.loginRoute,
      routes: {
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.signupRoute: (context) => RegistrationPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
