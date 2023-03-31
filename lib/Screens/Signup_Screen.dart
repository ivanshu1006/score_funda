import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Signin_Screen.dart';
import 'package:scorefunda/Screens/VerifyMobile.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'Widgets/top_bar.dart';
import 'Constants.dart';
import 'Widgets/rounded_Button.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:scorefunda/Screens/VerifyMobile.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = "SignUpScreen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String mobile = "";
  String userName = "";
  String password = "";
  String errorMessage = "";

  void setMobile(value) {
    setState(() {
      mobile = value;
    });
  }

  void setUserName(value) {
    setState(() {
      userName = value;
    });
  }

  void setPassword(value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign Up", style: kTitleStyle),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Already have an account?", style: kSubTitleStyle),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Sign In",
                        style:
                            kSubTitleStyle.copyWith(color: Color(0xffffb800)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("Welcome!", style: kTitleStyle.copyWith(color: kTextColor)),
          Text("Let's sign up to begin...",
              style: kSubTitleStyle.copyWith(color: kTextColor)),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Column(
              children: [
                InputField(
                  title: "Full Name",
                  onType: setUserName,
                ),
                InputField(
                  title: "Mobile No",
                  onType: setMobile,
                ),
                InputField(
                  title: "Password",
                  onType: setPassword,
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedSidedButton(
                  onTap: () async {
                    http.Response res =
                        await auth.signUp(userName, mobile, password);

                    if (res.statusCode == 200) {
                      String otp =
                          jsonDecode(res.body)["data"]["otp"].toString();
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MobileVerify(mobileNo: mobile, sendOtp: otp)),
                        );
                      });
                    } else {
                      errorMessage = jsonDecode(res.body)["message"];
                    }
                  },
                  ButtonText: "Continue to Sign Up",
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
          )
        ],
      ),
    );
  }
}
