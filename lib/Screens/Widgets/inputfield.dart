import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Constants.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, this.title, this.isHide = false});
  final String? title;
  final bool isHide;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        // padding: EdgeInsets.symmetric(horizontal: 30),
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  color: kTextColor),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE8E8E8)),
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            )
          ],
        ));
  }
}
