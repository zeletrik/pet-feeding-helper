import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    backgroundColor: Colors.white,
    dividerColor: Color.fromARGB(200, 247, 247, 247),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 25.0, color: Colors.black),
      headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ,color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    backgroundColor: Color.fromARGB(255, 32, 33, 36),
    dividerColor: Color.fromARGB(200, 18, 18, 18),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 25.0, color: Colors.white),
      headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ,color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.blue, foregroundColor: Colors.white),
  );
}
