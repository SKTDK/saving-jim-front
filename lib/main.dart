/* Authors: Gauthier Grandhenry Cyril HENNEN Marcin Krasowski */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/pages/ManagerDashboard.dart';
import 'Utils/ThemedApp.dart';
import 'views/pages/LoginPage.dart';
import 'dart:async';
import 'view_models/LoginPageViewModel.dart';
import 'view_models/ManagerDashboardViewModel.dart';
import 'services/apiService.dart';
import 'package:meta/meta.dart';

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
  var token;
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
          child: new Image.asset('assets/images/logo.png'),
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
    token = sharedPreferences.getString('token');

// if user has a token -> Dashboard
// if user has no token -> login
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ManagerDashboard(viewModel: managerDashboardViewModel),
          ),
          (r) => false);
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
