import 'package:flutter/material.dart';
import 'package:sliding_puzzle/board.dart';
import 'package:sliding_puzzle/theme/theme_constants.dart';
import 'package:sliding_puzzle/theme/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'sliding Puzzle',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        home:  const Board()
    );
  }
}
