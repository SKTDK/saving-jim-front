import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class AddChildViewModel extends Model {
  final ApiService apiSvc;
  AddChildViewModel({@required this.apiSvc});

  Future<bool> addUser(BuildContext context, String firstname, String lastname,
      String username, String password) async {
    return apiSvc?.addUser(
        firstname, lastname, username, password, constants.CHILD_ACCOUNT_TYPE);
  }
}
