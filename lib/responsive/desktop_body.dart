import 'package:flutter/material.dart';

class MyDesktopBody extends StatelessWidget {
  MyDesktopBody({required this.width, required this.height, Key? key})
      : super(key: key);
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('D E S K T O P'),
      ),
    );
  }
}
