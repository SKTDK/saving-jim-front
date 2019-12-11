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
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal),
        subhead: TextStyle(
            color: Colors.black87,
            fontSize: 36.0,
            fontWeight: FontWeight.normal),
        caption: TextStyle(color: Colors.white, fontSize: 12.0),
        body1: TextStyle(color: Colors.white, fontSize: 20.0),
        body2: TextStyle(color: Colors.white, fontSize: 24),
        display1: TextStyle(color: Colors.black87, fontSize: 22.0),
        display2: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
      ),
    );
  }

  static final List<Color> buttonSwatch = [
    // Colors.amber[500],
    // Colors.amber[800],
    // Colors.indigo[400],
    // Colors.indigo[600],
    Color(0xFF26A69A),
    Color(0xFF00695c),
  ];

  static final List<Color> primaryGradient = [
    // Colors.yellow[800],
    // Colors.yellow[700],
    // Colors.yellow[600],
    // Colors.yellow[400],
    Colors.teal[800],
    Colors.teal[700],
    Colors.teal[600],
    Colors.teal[400],
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
