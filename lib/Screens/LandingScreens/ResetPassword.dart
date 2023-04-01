import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/landingScreens/Signin_Screen.dart';
import 'package:scorefunda/Screens/landingScreens/VerifyMobile.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:scorefunda/Screens/landingScreens/VerifyMobile.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key, required this.otp, required this.mobile});
  static String id = "ResetPassword";
  String otp;
  String mobile;
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String otp = "";
  String newPassword = "";
  String confirmPassword = "";
  bool showModal = false;
  String errorMessage = "";

  void setOtp(value) {
    setState(() {
      otp = value;
    });
  }

  void setPassword(value) {
    setState(() {
      newPassword = value;
    });
  }

  initState() {
    // ------------ trigger toaster -------------------
    setState(() {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 8,
          backgroundColor: kPrimaryColor,
          msg: "your otp is ${widget.otp}");
    });
  }

  void setConfirmPassword(value) {
    setState(() {
      confirmPassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showModal,
      progressIndicator: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      color: kPrimaryColor,
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              TopBar(
                childWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reset Password", style: kTitleStyle),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Welcome!", style: kTitleStyle.copyWith(color: kTextColor)),
              Text("Let's set new password..",
                  style: kSubTitleStyle.copyWith(color: kTextColor)),
              SizedBox(
                height: 20,
              ),
              InputField(
                title: "OTP",
                onType: setOtp,
              ),
              InputField(
                title: "New Password",
                onType: setPassword,
              ),
              InputField(
                title: "Confirm Password",
                onType: setConfirmPassword,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedSidedButton(
                onTap: () async {
                  http.Response res = await auth.ResetPassword(
                      otp, widget.mobile, newPassword, confirmPassword);
                  if (res.statusCode == 200) {
                    setState(() {
                      Navigator.pushNamed(context, SignInScreen.id);
                    });
                  } else {
                    print(res.body);
                  }
                },
                ButtonText: "Change Password",
              ),
              SizedBox(height: 10),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'QuickSand',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
