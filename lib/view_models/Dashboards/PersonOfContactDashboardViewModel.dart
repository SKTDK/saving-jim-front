import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/ChildDashboard/GameListViewModel.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';
import 'package:saving_jim/view_models/PersonOfContact/PersonOfContactListViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

final GameListViewModel gameListViewModel =
    GameListViewModel(apiSvc: ApiService());

final ContactChildListViewModel contactChildListViewModel =
    ContactChildListViewModel(apiSvc: ApiService());

class PersonOfContactDashboardViewModel extends Model {
  final ApiService apiSvc;
  PersonOfContactDashboardViewModel({@required this.apiSvc});

  void clearPreferences(BuildContext context) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();
  }
}
