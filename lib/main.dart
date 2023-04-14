import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/landingScreens/Signup_Screen.dart';
import 'package:scorefunda/Screens/landingScreens/home_screen.dart';
import 'Screens/landingScreens/SplashScreen.dart';
import 'Screens/landingScreens/Signin_Screen.dart';
import 'Screens/landingScreens/ForgotPassword.dart';

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
          HomeScreen.id: ((context) => const HomeScreen()),
          ForgotPassword.id: ((context) => ForgotPassword()),
        });
  }
}
