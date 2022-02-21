import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  ImageDisplay(this.imagePath, {Key? key}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,),
        ));
  }
}
