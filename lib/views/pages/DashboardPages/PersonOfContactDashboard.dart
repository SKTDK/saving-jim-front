import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Dashboards/PersonOfContactDashboardViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class PersonOfContactDashboard extends StatefulWidget {
  final PersonOfContactDashboardViewModel viewModel;
  PersonOfContactDashboard({Key key, @required this.viewModel})
      : super(key: key);

  @override
  _PersonOfContactDashboardState createState() =>
      _PersonOfContactDashboardState();
}

class _PersonOfContactDashboardState extends State<PersonOfContactDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<PersonOfContactDashboardViewModel>(
          model: widget.viewModel),
    );
  }
}
