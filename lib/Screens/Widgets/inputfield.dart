import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, this.title});
  final String? title;
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
                  fontFamily: 'QuickSand', fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(),
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
