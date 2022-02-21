import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Grid extends StatelessWidget {
  Grid(this.number, this.onClick, {Key? key}) : super(key: key);
  var number = [];
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height* 0.5 ,
      width: MediaQuery.of(context).size.width *0.5,
      child: GridView.builder(
        itemCount: number.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return (number[index] != 0) ? GestureDetector(
                    onTap: () => onClick(index),
                    child: Card(
                      elevation: 10,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: FittedBox(
                            child: Text(number[index].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.greenAccent,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),),
                          ),
                        ),
                      ),
                    ),
                  )
            : const SizedBox.shrink();
          }),
    );
  }
}
