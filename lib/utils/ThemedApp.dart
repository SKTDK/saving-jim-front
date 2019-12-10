import 'package:flutter/material.dart';

// Global Theme Data in one place
abstract class ThemedApp {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.blueGrey,
      primaryColorLight: Colors.black38,
      primaryColorDark: Colors.blueGrey[900],
      backgroundColor: Colors.black,
      fontFamily: 'Open Sans',

      // Defines the default TextTheme
      textTheme: TextTheme(
        headline: TextStyle(
            color: Colors.white,
            fontSize: 58.0,
            letterSpacing: .09,
            fontWeight: FontWeight.bold),
        title: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.normal),
        subhead: TextStyle(
            color: Colors.black87,
            fontSize: 36.0,
            fontWeight: FontWeight.normal),
        caption: TextStyle(color: Colors.white, fontSize: 12.0),
        body1: TextStyle(color: Colors.white, fontSize: 20.0),
        body2: TextStyle(color: Colors.black87, fontSize: 20.0),
      ),
    );
  }

  static final List<Color> primaryGradient = [
    Colors.green[800],
    Colors.green[700],
    Colors.green[600],
    Colors.green[400],
  ];
  static final List<Color> secondaryGradient = [
    Colors.blueGrey[800],
    Colors.blueGrey[700],
    Colors.blueGrey[600],
    Colors.blueGrey[400],
  ];

// Funny colors for the kids :)
  static final List<Color> primaryGradientChild = [
    Colors.green[800],
    Colors.green[700],
    Colors.green[600],
    Colors.green[400],
  ];
  static final List<Color> secondaryGradientChild = [
    Colors.deepPurple[800],
    Colors.deepPurple[700],
    Colors.deepPurple[600],
    Colors.deepPurple[400],
  ];
}
