import 'package:flutter/material.dart';

// Global Theme Data in one place
abstract class ThemedApp {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      fontFamily: 'Open Sans',

      // Defines the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
          headline: TextStyle(
              fontSize: 58.0, letterSpacing: .09, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0),
          caption: TextStyle(color: Colors.grey, fontSize: 12.0),
          body1: TextStyle(fontSize: 20.0)),

      // Defines the default ButtonThemeData.
      // ButtonTextTheme.primary = if button dark -> text white. If button bright -> text dark (auto)
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(),
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
