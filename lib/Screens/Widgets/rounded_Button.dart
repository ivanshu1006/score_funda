import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';

class RoundedSidedButton extends StatelessWidget {
  RoundedSidedButton(
      {super.key, this.ButtonText = "click me", required this.onTap});

  String ButtonText;
  Function onTap;
  Color ButtonColor = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: FilledButton(
        onPressed: () {
          onTap();
        },
        child: Text(ButtonText),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 18),
          textStyle: TextStyle(
              fontFamily: 'QuickSand',
              fontSize: 15,
              fontWeight: FontWeight.bold),
          primary: ButtonColor,
        ),
      ),
    );
  }
}
