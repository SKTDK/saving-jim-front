import 'package:flutter/material.dart';
import 'GradientAppBar.dart';
import 'package:pfefront/widget/Survey/SurveyHome.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("pfefront"),
          new SurveyHome(),       
        ],
      ),
    );
  }
}

