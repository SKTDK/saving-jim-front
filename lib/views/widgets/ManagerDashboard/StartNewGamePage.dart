import 'package:flutter/material.dart';

class StartNewGamePage extends StatefulWidget {
  @override
  _StartNewGamePageState createState() => _StartNewGamePageState();
}

class _StartNewGamePageState extends State<StartNewGamePage> {
  @override
  Widget build(BuildContext context) {
    // TODO
    return MaterialApp(
      title: 'Lancer une nouvelle partie',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lancer une nouvelle partie'),
        ),
        body: Center(
          child: Text('Lancer une nouvelle partie'),
        ),
      ),
    );
  }
}
