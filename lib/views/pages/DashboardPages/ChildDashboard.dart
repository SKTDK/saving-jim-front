import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/view_models/ChildDashboardViewModel.dart';

class ChildDashboard extends StatefulWidget {
  final ChildDashboardViewModel viewModel;
  ChildDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ChildDashboardState createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<ChildDashboardViewModel>(model: widget.viewModel),
    );
  }
}
