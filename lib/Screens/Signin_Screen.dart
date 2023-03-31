import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/ChangePass.dart';
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
  String mobileNo = "";
  String password = "";

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
                  onTap: () {
                    print("mobile no : $mobileNo. password : $password");
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
