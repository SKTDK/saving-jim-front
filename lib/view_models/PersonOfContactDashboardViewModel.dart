import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

class PersonOfContactDashboardViewModel extends Model {
  final ApiService apiSvc;
  PersonOfContactDashboardViewModel({@required this.apiSvc});
}
