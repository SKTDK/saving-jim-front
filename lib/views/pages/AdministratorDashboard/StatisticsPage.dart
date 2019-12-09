import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/StatisticsViewModel.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/views/widgets/CustomButton.dart';

class StatisticsPage extends StatefulWidget {
  final StatisticsViewModel viewModel;

  StatisticsPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO
    return MaterialApp(
      title: 'Vue d\'ensemble',
      theme: ThemedApp.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vue d\'ensemble'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
