import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Signin_Screen.dart';
import 'package:scorefunda/Screens/VerifyMobile.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'Widgets/top_bar.dart';
import 'Constants.dart';
import 'Widgets/rounded_Button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = "SignUpScreen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                ),
                InputField(
                  title: "Mobile No",
                ),
                InputField(
                  title: "Password",
                  isHide: true,
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedSidedButton(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, MobileVerify.id);
                    });
                  },
                  ButtonText: "Continue to Sign Up",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
