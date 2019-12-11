import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/AccountStateListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class AccountStateViewModel extends Model {
  final ApiService apiSvc;
  AccountStateViewModel({@required this.apiSvc});
  List<User> users;
  Future<List<User>> fetchUsers(String accountType) async {
    int accountTypeInt;
    switch (accountType) {
      case 'Accompagnateur':
        accountTypeInt = constants.MANAGER_ACCOUNT_TYPE;
        break;
      case 'Enfant':
        accountTypeInt = constants.CHILD_ACCOUNT_TYPE;
        break;
      case 'Personne de contact':
        accountTypeInt = constants.PERSONOFCONTACT_ACCOUNT_TYPE;
        break;
    }
    return apiSvc.fetchUsers(accountTypeInt);
  }

  displayList(BuildContext context, String accountType) {
    fetchUsers(accountType).then((result) async {
      users = result;
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<AccountStateViewModel>(
              model: this, child: AccountStateListPage(viewModel: this)),
        ),
      );
    });
  }

  void changeState(User root) {
    apiSvc.changeAccountState(root).then((res) {
      root.active = !root.active;
      notifyListeners();
    });
  }
}
