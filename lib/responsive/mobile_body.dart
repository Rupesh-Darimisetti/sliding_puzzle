import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  MyMobileBody(double d, {required this.height, Key? key}) : super(key: key);
  double height = 0.5;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.green);
  }
}
