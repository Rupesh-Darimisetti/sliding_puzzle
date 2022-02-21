import 'package:flutter/material.dart';

const colorPrimary=Colors.deepOrange;
const colorAccent=Colors.orange;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
primaryColor: colorPrimary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
          )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(colorAccent)
    ),

  ),
);


  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
      backgroundColor: Colors.red,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
        ),

      )
  );