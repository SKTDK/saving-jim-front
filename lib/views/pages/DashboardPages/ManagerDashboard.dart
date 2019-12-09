import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/view_models/ManagerDashboardViewModel.dart';

class ManagerDashboard extends StatefulWidget {
  final ManagerDashboardViewModel viewModel;
  ManagerDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ManagerDashboardState createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<ManagerDashboardViewModel>(model: widget.viewModel),
    );
  }
}
