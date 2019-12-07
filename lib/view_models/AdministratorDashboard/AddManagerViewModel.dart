import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';

class AddManagerViewModel extends Model {
  final ApiService apiSvc;
  AddManagerViewModel({@required this.apiSvc});

  Future<bool> addManager(BuildContext context, String firstname,
      String lastname, String username, String password) async {
    return apiSvc?.addManager(firstname, lastname, username, password);
  }
}
