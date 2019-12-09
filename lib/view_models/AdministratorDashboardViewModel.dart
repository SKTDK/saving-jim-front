import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AddManagerViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/StatisticsViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

final AddManagerViewModel addManagerViewModel =
    AddManagerViewModel(apiSvc: ApiService());

final AccountStateViewModel accountStateViewModel =
    AccountStateViewModel(apiSvc: ApiService());

final AccountEditorViewModel accountEditorViewModel =
    AccountEditorViewModel(apiSvc: ApiService());

final StatisticsViewModel statisticsViewModel =
    StatisticsViewModel(apiSvc: ApiService());

class AdministratorDashboardViewModel extends Model {
  final ApiService apiSvc;
  AdministratorDashboardViewModel({@required this.apiSvc});

  User _user;
  User get user => _user;
  set user(User value) {
    _user = value;
    notifyListeners();
  }

  void fetchCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = new User.fromJson(jsonDecode(sharedPreferences.getString('user')));
  }

  void clearPreferences(BuildContext context) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();
  }
}
