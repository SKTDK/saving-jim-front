import 'package:flutter/material.dart';

// Global Theme Data in one place
abstract class ThemedApp {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.blueGrey,
      primaryColorLight: Colors.black38,
      primaryColorDark: Colors.black54,
      backgroundColor: Colors.black,
      fontFamily: 'Open Sans',
      // Defines the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
          headline: TextStyle(
              color: Colors.white,
              fontSize: 58.0,
              letterSpacing: .09,
              fontWeight: FontWeight.bold),
          title: TextStyle(
              color: Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.normal),
          subhead: TextStyle(
              color: Colors.black87,
              fontSize: 36.0,
              fontWeight: FontWeight.normal),
          caption: TextStyle(color: Colors.white, fontSize: 12.0),
          body1: TextStyle(color: Colors.white, fontSize: 20.0),
          body2: TextStyle(color: Colors.black87, fontSize: 20.0)),

      // Defines the default ButtonThemeData.
      // ButtonTextTheme.primary = if button dark -> text white. If button bright -> text dark (auto)
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(),
        buttonColor: Colors.black87,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
