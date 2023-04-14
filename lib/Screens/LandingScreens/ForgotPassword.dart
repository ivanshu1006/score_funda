import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/LandingScreens/ResetPassword.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'package:scorefunda/Screens/HomeScreen/home_screen.dart';
import 'package:scorefunda/Screens/landingScreens/verifyDob.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});
  static String id = "ForgotPassword";
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String mobileNo = "";
  String errorMessage = "";
  void setMobile(value) {
    setState(() {
      mobileNo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            //----------------top bar ----------------------
            TopBar(
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password",
                    style: kTitleStyle.copyWith(fontSize: 22),
                  ),
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
            Text("Let's verify mobile to begin...",
                style: kSubTitleStyle.copyWith(color: kTextColor)),
            SizedBox(
              height: 40,
            ),
            InputField(
              title: "Mobile No",
              onType: setMobile,
            ),
            SizedBox(height: 15),
            RoundedSidedButton(
                onTap: () async {
                  http.Response res = await auth.ForgotPassword(mobileNo);
                  String otp = jsonDecode(res.body)["data"].toString();
                  if (res.statusCode == 200) {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ResetPasswordScreen(otp: otp, mobile: mobileNo),
                        ),
                      );
                    });
                  } else {
                    setState(() {
                      errorMessage = jsonDecode(res.body)["message"];
                    });
                  }
                },
                ButtonText: "Verify Mobile"),
            SizedBox(height: 30),
            Text(
              errorMessage,
              style:
                  TextStyle(fontFamily: 'QuickSand', color: Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}
