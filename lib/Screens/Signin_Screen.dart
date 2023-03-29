import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Signup_Screen.dart';
import 'package:scorefunda/Screens/Widgets/InputField.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'Constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = "";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
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
                          style: kSubTitleStyle.copyWith(color: Colors.yellow)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Text("Welcome!", style: kTitleStyle.copyWith(color: Colors.black)),
          Text("Lets sign in to begin...",
              style: kSubTitleStyle.copyWith(color: Colors.black)),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: Column(
              children: [
                InputField(
                  title: "Mobile No",
                ),
                InputField(
                  title: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedSidedButton(
                  onTap: () {},
                  ButtonText: "Continue to Sign In",
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    // TOD forget password
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(fontFamily: 'QuickSand'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}