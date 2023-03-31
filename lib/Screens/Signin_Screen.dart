import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/ChangePass.dart';
import 'package:scorefunda/Screens/Signup_Screen.dart';
import 'package:scorefunda/Screens/Widgets/InputField.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/home_screen.dart';
import 'Constants.dart';
import 'package:http/http.dart' as http;
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = "";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String mobileNo = "";
  String password = "";
  String errorMessage = "";
  bool showModal = false;

  void SetPassword(pass) {
    setState(() {
      password = pass;
    });
  }

  void SetMobileNo(value) {
    setState(() {
      mobileNo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: showModal,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Column(
          children: [
            TopBar(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign In", style: kTitleStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Don't have an account?", style: kSubTitleStyle),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          });
                        },
                        child: Text("Sign Up",
                            style: kSubTitleStyle.copyWith(
                                color: Color(0xffffD869))),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Text("Welcome!", style: kTitleStyle.copyWith(color: kTextColor)),
            Text("Let's sign in to begin...",
                style: kSubTitleStyle.copyWith(color: kTextColor)),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: Column(
                children: [
                  InputField(title: "Mobile No", onType: SetMobileNo),
                  InputField(title: "Password", onType: SetPassword),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedSidedButton(
                    onTap: () async {
                      setState(() {
                        showModal = true;
                      });
                      http.Response res = await auth.signIn(mobileNo, password);
                      if (res.statusCode == 200) {
                        setState(() {
                          showModal = false;
                          Navigator.pushNamed(context, HomeScreen.id);
                        });
                      } else {
                        setState(() {
                          showModal = false;
                          errorMessage = jsonDecode(res.body)["message"];
                        });
                      }
                    },
                    ButtonText: "Continue to Sign In",
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        Navigator.pushNamed(context, ForgetPassword.id);
                      });
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: kTextColor,
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'QuickSand',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
