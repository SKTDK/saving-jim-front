import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/PersonOfContact/ContactChildListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class ContactChildListViewModel extends Model {
  final ApiService apiSvc;
  ContactChildListViewModel({@required this.apiSvc});

  List<User> users;

  void fetchChild(BuildContext context) async {
    apiSvc
        .fetchUsersByPersonOfContact(constants.PERSONOFCONTACT_ACCOUNT_TYPE)
        .then((result) {
      users = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContactChildListPage(viewModel: this)));
    });
  }

  void redirect(BuildContext context, List<User> root) {
    users = root;
  }
}
