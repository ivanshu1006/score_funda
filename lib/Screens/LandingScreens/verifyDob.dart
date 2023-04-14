import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';
import 'package:scorefunda/Screens/Widgets/rounded_Button.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';
import 'package:scorefunda/Screens/Widgets/inputfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:scorefunda/Screens/HomeScreen/home_screen.dart';
import 'package:scorefunda/Services/authentication.dart' as auth;

class VerifyDOB extends StatefulWidget {
  VerifyDOB({super.key, required this.userName, required this.token});
  static String id = "VerifyDOB";
  String userName = "";
  String token;
  @override
  State<VerifyDOB> createState() => _VerifyDOBState();
}

class _VerifyDOBState extends State<VerifyDOB> {
  String dateOfBirth = "";
  String email = "";
  bool showModal = false;

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
              RoundedSidedButton(
                  onTap: () async {
                    setState(() {
                      showModal = true;
                    });

                    http.Response res =
                        await auth.SignUpInfo(dateOfBirth, email, widget.token);
                    if (res.statusCode == 200) {
                      setState(() {
                        showModal = false;
                        Navigator.pushNamed(context, HomeScreen.id);
                      });
                    } else {
                      setState(() {
                        showModal = false;
                      });
                    }
                  },
                  ButtonText: "Continue"),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
