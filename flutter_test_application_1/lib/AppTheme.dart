import 'package:flutter/material.dart';

// Global Theme For App
class AppTheme {
  ThemeData buildThemeData() {
    return ThemeData(
        // Global Color Style
        primarySwatch: Colors.lime,
        primaryColor: Colors.lime[400],
        accentColor: Colors.yellow,

        // Global Text Style
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cutive',
          ),
          headline6: TextStyle(fontSize: 46.0),
          bodyText2: TextStyle(fontSize: 40.0, color: Colors.greenAccent),
        ));
  }
}
