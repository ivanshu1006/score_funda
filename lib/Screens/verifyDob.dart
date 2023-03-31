import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';

class VerifyDOB extends StatefulWidget {
  VerifyDOB({super.key, required this.userName});
  static String id = "VerifyDOB";
  String userName = "";
  @override
  State<VerifyDOB> createState() => _VerifyDOBState();
}

class _VerifyDOBState extends State<VerifyDOB> {
  String dateOfBirth = "";
  String email = "";

  void setDob(value) {
    setState(() {
      dateOfBirth = value;
    });
  }

  void setEmail(value) {
    setState(() {
      email = value;
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
                  "Welcome ${widget.userName},",
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
          Text("Let us know you",
              style: kTitleStyle.copyWith(color: kTextColor)),
          Text("to suggest matching tests new passowrd",
              style: kSubTitleStyle.copyWith(color: kTextColor)),
          SizedBox(
            height: 25,
          ),
          InputField(
            title: "Date of Birth",
            onType: setDob,
          ),
          InputField(
            title: "Email",
            onType: setEmail,
          ),
          SizedBox(height: 20),
          RoundedSidedButton(onTap: () {}, ButtonText: "Continue")
        ],
      ),
    );
  }
}
