import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/utils/constants.dart' as constants;
import 'package:saving_jim/views/pages/AdministratorDashboard/AccountEditorListPage.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/UserAccountEditorPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountEditorViewModel extends Model {
  final ApiService apiSvc;
  AccountEditorViewModel({@required this.apiSvc});

  User selectedUser;
  List<User> users;
  int selectedAccountType;
  User currentUser;

  Future<User> fetchCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.currentUser =
        new User.fromJson(jsonDecode(sharedPreferences.getString('user')));
    return currentUser;
  }

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
              builder: (context) => AccountEditorListPage(viewModel: this)));
    });
  }

  Future<List<User>> fetchSearchResult(String text) async {
    return apiSvc.fetchSearchResult(selectedAccountType, text);
  }

  Future<List<User>> search(BuildContext context, String text) {
    return fetchSearchResult(text);
  }

  void editUser(BuildContext context, User root) async {
    selectedUser = root;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScopedModel<AccountEditorViewModel>(
            model: this, child: UserAccountEditorPage(viewModel: this)),
      ),
    );
  }

  Future<bool> updateCurrentUser(
      String newFirstname, String newLastname, String newPassword) async {
    if (newFirstname == "") newFirstname = null;
    if (newLastname == "") newLastname = null;
    if (newPassword == "") newPassword = null;
    if (newFirstname == null && newLastname == null && newPassword == null) {
      return false;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    ;
    User currentUser =
        new User.fromJson(jsonDecode(sharedPreferences.getString('user')));
    bool ret = await apiSvc.updateAccount(currentUser.accountType,
        currentUser.id, newFirstname, newLastname, newPassword);

    if (ret) {
      if (newFirstname != null) currentUser.firstname = newFirstname;
      if (newLastname != null) currentUser.lastname = newLastname;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('user', jsonEncode(currentUser));
    }
    return ret;
  }

  Future<bool> updateSelectedUser(
      String newFirstname, String newLastname, String newPassword) async {
    if (newFirstname == "") newFirstname = null;
    if (newLastname == "") newLastname = null;
    if (newPassword == "") newPassword = null;
    if (newFirstname == null && newLastname == null && newPassword == null) {
      return false;
    }
    bool ret = await apiSvc.updateAccount(selectedUser.accountType,
        selectedUser.id, newFirstname, newLastname, newPassword);

    if (ret) {
      if (newFirstname != null) selectedUser.firstname = newFirstname;
      if (newLastname != null) selectedUser.lastname = newLastname;
    }
    return ret;
  }

  void redirect(BuildContext context, List<User> root) {
    print('root.length');
    if (root.length == 1) {
      selectedUser = root[0];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<AccountEditorViewModel>(
              model: this, child: UserAccountEditorPage(viewModel: this)),
        ),
      );
    } else if (root.length > 1) {
      users = root;
    }
  }
}
