import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/Login/LoginPage.dart';
import '../Utils/ThemedApp.dart';

// Logout
// TODO: clear navigator stack
class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _clearPreferences(context);

    return MaterialApp(
      home: LoginPage(),
      theme: ThemedApp.getThemeData(),
    );
  }

  void _clearPreferences(BuildContext context) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();
  }
}
