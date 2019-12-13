import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/pages/ChildDashboard/PersonOfContactListPage.dart';
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/CreateGameListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class PersonOfContactListViewModel extends Model {
  final ApiService apiSvc;
  PersonOfContactListViewModel({@required this.apiSvc});

  List<User> users;

  void fetchPersonOfContact(BuildContext context) async {
    apiSvc.fetchUsersByUsers(constants.CHILD_ACCOUNT_TYPE).then((result) {
      users = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PersonOfContactListPage(viewModel: this)));
    });
  }

  void redirect(BuildContext context, List<User> root) {
    users = root;
  }
}
