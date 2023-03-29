import 'package:flutter/material.dart';
import 'package:scorefunda/Screens/Widgets/top_bar.dart';

class MobileVerify extends StatefulWidget {
  const MobileVerify({super.key});
  static String id = "MobileVerify";
  @override
  State<MobileVerify> createState() => _MobileVerifyState();
}

class _MobileVerifyState extends State<MobileVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [TopBar()],
      ),
    );
  }
}
