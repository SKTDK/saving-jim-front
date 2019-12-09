import 'package:flutter/material.dart';

Widget gradientButton = Container(
  child: RaisedButton(
    onPressed: () {},
    textColor: Colors.white,
    padding: const EdgeInsets.all(0.0),
    child: Container(
      width: 300,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [
          Color.fromARGB(255, 148, 231, 225),
          Color.fromARGB(255, 62, 182, 226)
        ],
      )),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "Gradient Button",
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
