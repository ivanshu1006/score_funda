import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Signup_Screen.dart';
import 'package:scorefunda/Screens/VerifyMobile.dart';
import 'package:scorefunda/Screens/home_screen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/Signin_Screen.dart';
import 'Screens/ChangePass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: ((context) => const SplashScreen()),
          SignInScreen.id: ((context) => const SignInScreen()),
          SignUpScreen.id: ((context) => const SignUpScreen()),
          ForgetPassword.id: ((context) => const ForgetPassword()),
          HomeScreen.id: ((context) => const HomeScreen())
        });
  }
}
