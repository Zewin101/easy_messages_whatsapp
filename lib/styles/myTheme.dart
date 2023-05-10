import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(

      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          color: MASTERCOLOR,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
          color: MASTERCOLOR3,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: MASTERCOLOR,
          type:BottomNavigationBarType.fixed ,
          selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.white));

  static ThemeData darkTheme = ThemeData();
}
