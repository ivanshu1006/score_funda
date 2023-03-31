import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'package:scorefunda/Screens/home_screen.dart';
import 'package:scorefunda/Screens/verifyDob.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class MobileVerify extends StatefulWidget {
  MobileVerify(
      {super.key,
      required this.mobileNo,
      required this.sendOtp,
      required this.userName});
  String mobileNo;
  static String id = "MobileVerify";
  String userName;
  String sendOtp;
  @override
  State<MobileVerify> createState() => _MobileVerifyState();
}

class _MobileVerifyState extends State<MobileVerify> {
  String otp = "";
  void setOtp(value) {
    setState(() {
      otp = value;
    });
  }

  initState() {
    // ------------ trigger toaster -------------------
    setState(() {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 8,
          backgroundColor: kPrimaryColor,
          msg: "your otp is ${widget.sendOtp}");
    });
  }

// 634179

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
                    "Welcome ${widget.userName}",
                    style: kTitleStyle.copyWith(fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Glad to see you",
                    style: kSubTitleStyle,
                  ),
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
              height: 25,
            ),
            InputField(
              title: "Enter OTP",
              onType: setOtp,
            ),
            SizedBox(height: 20),
            RoundedSidedButton(
                onTap: () async {
                  http.Response res =
                      await auth.ValidateOtp(widget.mobileNo, otp);
                  String Token =
                      jsonDecode(res.body)["data"]["tokendata"]["token"];
                  if (res.statusCode == 200) {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyDOB(
                                  userName: widget.userName,
                                  token: Token,
                                )),
                      );
                    });
                  }
                },
                ButtonText: "Verify Mobile"),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
