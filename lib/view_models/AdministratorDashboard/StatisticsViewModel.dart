import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';

class StatisticsViewModel extends Model {
  final ApiService apiSvc;
  StatisticsViewModel({@required this.apiSvc});

  // Future<bool> Statistics(BuildContext context, String firstname,
  //     String lastname, String username, String password) async {
  //   return apiSvc?.Statistics(firstname, lastname, username, password);
  // }
}
