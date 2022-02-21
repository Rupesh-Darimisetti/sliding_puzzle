import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive/dimensions.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  Grid(this.number, this.onClick, {Key? key}) : super(key: key);
  var number = [];
  Function onClick;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width <= mobileWidth ? 0.4 : 0.2;
    double height =
        MediaQuery.of(context).size.height <= mobileWidth ? 0.4 : 0.5;

    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: SafeArea(
        child: GridView.builder(
            itemCount: number.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return (number[index] != 0)
                  ? GestureDetector(
                      onTap: () => onClick(index),
                      child: Card(
                        elevation: 10,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: isDark ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                number[index].toString(),
                                style: GoogleFonts.roboto(
                                  color: isDark
                                      ? Colors.greenAccent
                                      : Colors.black38,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
      ),
    );
  }
}
