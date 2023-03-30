import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key, this.childWidget});

  Widget? childWidget;

  final BorderRadius bottomBorderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
            width: 300,
            height: 270,
            decoration: BoxDecoration(
                color: Color(0xff9969DF), borderRadius: bottomBorderRadius)),
        Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
                color: Color(0xff8252C8), borderRadius: bottomBorderRadius)),
        Container(
          height: 230,
          padding: EdgeInsets.only(top: 60, left: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xff6237A0), borderRadius: bottomBorderRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/logoLight.png',
                width: 200,
              ),
              SizedBox(
                height: 30,
              ),
              childWidget!
            ],
          ),
        ),
        const Positioned(
          right: -20,
          top: -25,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xff6647AA),
          ),
        ),
      ],
    );
  }
}
