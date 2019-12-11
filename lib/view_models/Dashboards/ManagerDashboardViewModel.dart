import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';
import 'package:saving_jim/view_models/ManagerDashboard/AddChildViewModel.dart';
import 'package:saving_jim/view_models/ManagerDashboard/CreateGameViewModel.dart';
import 'package:saving_jim/view_models/ManagerDashboard/ChildEditorViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());
final AddChildViewModel addChildViewModel =
    AddChildViewModel(apiSvc: ApiService());

final ChildEditorViewModel editChildViewModel =
    ChildEditorViewModel(apiSvc: ApiService());

final CreateGameViewModel createGameViewModel =
    CreateGameViewModel(apiSvc: ApiService());

class ManagerDashboardViewModel extends Model {
  final ApiService apiSvc;
  ManagerDashboardViewModel({@required this.apiSvc});

  void clearPreferences(BuildContext context) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();
  }
}
