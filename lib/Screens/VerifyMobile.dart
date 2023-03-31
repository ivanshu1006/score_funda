import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'package:scorefunda/Screens/home_screen.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;
import 'package:http/http.dart' as http;

class MobileVerify extends StatefulWidget {
  MobileVerify({super.key, required this.mobileNo});
  String mobileNo;
  static String id = "MobileVerify";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Shivprasad,",
                  style: kTitleStyle,
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
                if (res.statusCode == 200) {
                  setState(() {
                    Navigator.pushNamed(context, HomeScreen.id);
                  });
                }
              },
              ButtonText: "Verify Mobile")
        ],
      ),
    );
  }
}
