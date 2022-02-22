import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_puzzle/responsive/dimensions.dart';
import 'package:sliding_puzzle/theme/theme_manager.dart';
import 'package:sliding_puzzle/widget/grid.dart';
import 'package:sliding_puzzle/widget/image_widget.dart';
import "package:flutter/material.dart";
import 'package:sliding_puzzle/widget/size.dart';

ThemeManager _themeManager = ThemeManager();

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int noOfMoves = 0;
  int tiles = 15;
  DateTime currentTime = DateTime.now(), pastTime = DateTime.now();
  // Future<Stream<int>> times =
  // Stream.periodic(const Duration(seconds: 1), (x) => 1 + x++)
  //     as Future<Stream<int>>;
  int time = 0;
  @override
  void initState() {
    super.initState();
    number.shuffle();
    noOfMoves = 0;
    tiles = tiles;
    time = currentTime.minute;
    pastTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var tiles = number.length - 1;
    final currentWidth = MediaQuery.of(context).size.width;
    time = currentTime.minute;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) => _themeManager.toggleTheme(newValue)),
          isDark ? const Icon(Icons.dark_mode) : const Icon(Icons.sunny),
        ],
      ),
      body: SafeArea(
        child: currentWidth <= tabletWidth
            ? // Mobile and tablet devices
            Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      addVerticalSpace(20),
                      ImageDisplay('assets/images/logo1.jpg'),
                      addVerticalSpace(10),
                      Text("Puzzle Challenge",
                          style: GoogleFonts.roboto(
                            color: isDark ? Colors.greenAccent : Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$noOfMoves Moves | $tiles tiles",
                            style: GoogleFonts.roboto(
                              color: isDark ? Colors.greenAccent : Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Row(
                        children: [
                          addHorizontalSpace(currentWidth <= mobileWidth
                              ? currentWidth * .3
                              : currentWidth * .4),
                          Text(
                            parseTime(time),
                            style: GoogleFonts.roboto(
                                color:
                                    isDark ? Colors.greenAccent : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          addHorizontalSpace(10),
                          const Icon(Icons.timer_sharp),
                        ],
                      ),
                      addVerticalSpace(10),
                      Grid(number, onClick),
                      addVerticalSpace(30),
                      ElevatedButton(
                          onPressed: () => (number.shuffle()),
                          child: const Text('Shuffle')),
                      addVerticalSpace(30),
                    ],
                  ),
                ),
              )
            : //Destop View
            Column(
                children: [
                  ImageDisplay('assets/images/logo.jpg'),
                  Row(
                    children: [
                      addHorizontalSpace(30),
                      Column(
                        children: [
                          Text("Puzzle \nChallenge",
                              style: GoogleFonts.roboto(
                                color:
                                    isDark ? Colors.greenAccent : Colors.black,
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                              )),
                          addVerticalSpace(15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$noOfMoves Moves | $tiles tiles",
                                style: GoogleFonts.roboto(
                                  color:
                                      isDark ? Colors.greenAccent : Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          addVerticalSpace(50),
                          ElevatedButton(
                              onPressed: () => (number.shuffle()),
                              child: const Text('Shuffle')),
                        ],
                      ),
                      addHorizontalSpace(150),
                      addVerticalSpace(600),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(parseTime(time),
                                  style: GoogleFonts.roboto(
                                      color: isDark
                                          ? Colors.greenAccent
                                          : Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              addHorizontalSpace(10),
                              const Icon(Icons.timer_sharp),
                            ],
                          ),
                          addVerticalSpace(50),
                          Grid(number, onClick),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  void onClick(index) {
    if (index - 1 >= 0 && number[index - 1] == 0 && index % 4 != 0 ||
        (index + 1) < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4) >= 0 && number[index - 4] == 0 ||
        (index + 4) < 16 && number[index + 4] == 0) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        noOfMoves++;
        tiles--;
      });
    }
    checkWinner();
  }

  bool isSorted(List numberList) {
    int first = numberList.first;
    for (int i = 0; i < numberList.length; i++) {
      int nextNumber = numberList[i];
      if (first > nextNumber) return false;
      first = nextNumber;
    }
    return true;
  }

  Future<Text> checkWinner() async {
    bool isWinner = isSorted(number);
    return (isWinner) ? const Text('win') : const Text("Not Shorted");
  }

  String parseTime(int time) {
    final duration = Duration(
      seconds: time,
    );

    final days = duration.inDays.remainder(60).toString().padLeft(3, '0');

    final hours = duration.inHours.remainder(60).toString().padLeft(2, '0');

    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$days Days  $hours:$minutes:$seconds";
  }
}
