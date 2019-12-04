import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vue d\'ensemble',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vue d\'ensemble'),
        ),
        body: Center(
          child: Text('Vue d\'ensemble'),
        ),
      ),
    );
  }
}
