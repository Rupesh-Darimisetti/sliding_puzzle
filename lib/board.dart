import 'dart:math';

import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_puzzle/theme/theme_manager.dart';
import 'package:sliding_puzzle/widget/grid.dart';
import 'package:sliding_puzzle/widget/image_widget.dart';
import 'package:flutter/material.dart';

ThemeManager _themeManager = ThemeManager();

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int noOfMoves = 0;
  int tiles = 0;

  @override
  void initState() {
    super.initState();
    number.shuffle();
    noOfMoves = 0;
    tiles = number.length -1;
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    var tiles = number.length - 1;
    return Scaffold(

          appBar: AppBar(
            title: const Text('sliding puzzle'),
            actions: [
              Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue)=> _themeManager.toggleTheme(newValue),
            ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child:ImageDisplay("assets/images/logo.png"),),
            Center(
              child: Text("Puzzle Challenge",
                style: GoogleFonts.roboto(
                  color:isDark?Colors.greenAccent:Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "$noOfMoves Moves | $tiles tiles",
                  style:GoogleFonts.roboto(
                    color: isDark?Colors.greenAccent:Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(child:Grid(number, onClick),),
          Center(child:ElevatedButton(
              onPressed: () => getRandomElement(number),
              child:  const Text('Shuffle')),
          ),
        ],
      ),
    );
  }
  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
  void onClick(index) {
    if (index - 1 >= 0 && number[index - 1] == 0 && index % 4 != 0 ||
        (index + 1) < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4) >= 0 && number[index - 4] == 0 ||
        (index + 4 )< 16 && number[index + 4] == 0) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        noOfMoves++;
        tiles--;
      });
    }
    checkWinner();
  }

  bool isSorted(List numberList){
    int first= numberList.first;
    for(int i=0;i<numberList.length;i++) {
      int nextNumber = numberList[i];
      if(first >nextNumber) return false;
      first = nextNumber;
      tiles--;
    }
    return true;
  }
  void checkWinner(){
    bool isWinner =isSorted(number);
    if (isWinner) {
      print('win');
    } else {
      print("Not Shorted");
    }
  }
}
