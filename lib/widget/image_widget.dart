import 'package:flutter/material.dart';
import 'package:sliding_puzzle/responsive/dimensions.dart';

// ignore: must_be_immutable
class ImageDisplay extends StatelessWidget {
  ImageDisplay(this.imagePath, {Key? key}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height <= mobileWidth ? 40 : 80,
        width: MediaQuery.of(context).size.width <= mobileWidth ? 40 : 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ));
  }
}
