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
  int selectedAccountType;
  void fetchUsers(BuildContext context, String accountType) async {
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
    selectedAccountType = accountTypeInt;
    apiSvc.fetchUsers(accountTypeInt).then((result) {
      users = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountStateListPage(viewModel: this)));
    });
  }

  void redirect(BuildContext context, List<User> root) {
    users = root;
  }

  Future<bool> changeState(User root) {
    return apiSvc.changeAccountState(root).then((res) {
      root.active = !root.active;
      return res;
    });
  }

  Future<List<User>> fetchSearchResult(String text) async {
    return apiSvc.fetchSearchResult(selectedAccountType, text);
  }

  Future<List<User>> search(BuildContext context, String text) {
    return fetchSearchResult(text);
  }
}
