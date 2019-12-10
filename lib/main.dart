/* Authors: Gauthier Grandhenry Cyril HENNEN Marcin Krasowski */
import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Dashboards/ManagerDashboardViewModel.dart';
import 'package:saving_jim/view_models/NavigationHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_models/NavigationHandler.dart';
import 'utils/ThemedApp.dart';
import 'views/pages/Login/LoginPage.dart';
import 'dart:async';
import 'dart:convert';
import 'view_models/LoginPageViewModel.dart';
import 'services/ApiService.dart';
import 'package:meta/meta.dart';
import 'models/User.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

final ManagerDashboardViewModel managerDashboardViewModel =
    ManagerDashboardViewModel(apiSvc: ApiService());

// Starting point
void main() => runApp(
      MaterialApp(
        home: App(),
        debugShowCheckedModeBanner: false,
        theme: ThemedApp.getThemeData(),
      ),
    );

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState(
      loginPageViewModel: loginPageViewModel,
      managerDashboardViewModel: managerDashboardViewModel);
}

class _AppState extends State<App> {
  final LoginPageViewModel loginPageViewModel;
  final ManagerDashboardViewModel managerDashboardViewModel;

  _AppState(
      {@required this.loginPageViewModel,
      @required this.managerDashboardViewModel});

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

// Splash screen
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(300),
        child: new Center(
          child: new Image.asset('assets/img/logo.png'),
        ),
      ),
    );
  }

// Splash screen length
  void _startTimer() {
    Timer(Duration(seconds: 1), () {
      _navigateToEntryPoint();
    });
  }

// Navigation after timer expires
  void _navigateToEntryPoint() async {
    // Retrieves the token from the device
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userString = sharedPreferences.getString('user');

    // if user has a token -> Dashboard
    // if user has no token -> login
    if (userString != null) {
      User user = User.fromJson(jsonDecode(userString));
      NavigationHandler.handleNavigation(context, user.accountType);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(viewModel: loginPageViewModel),
          ),
          (r) => false);
    }
  }
}
