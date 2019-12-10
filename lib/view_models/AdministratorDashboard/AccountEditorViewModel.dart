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

  // fetch account list
  Future<List<User>> _users;
  Future<List<User>> get users => _users;
  set users(Future<List<User>> value) {
    _users = value;
    notifyListeners();
  }

  // gets the current user
  User _currentUser;
  User get currentUser => _currentUser;

  set currentUser(User value) {
    _currentUser = value;
    notifyListeners();
  }

  void fetchCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentUser =
        new User.fromJson(jsonDecode(sharedPreferences.getString('user')));
    notifyListeners();
  }

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
    //TODO
    users = apiSvc.fetchUsers(accountTypeInt);
    return _users;
  }

  void displayList(BuildContext context, String accountType) async {
    await fetchUsers(accountType).then((result) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<AccountEditorViewModel>(
              model: this,
              child: AccountEditorListPage(viewModel: this, list: result)),
        ),
      );
    });
  }

  User _selectedUser;
  User get selectedUser => _selectedUser;

  set selectedUser(User value) {
    _selectedUser = value;
    notifyListeners();
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
    bool ret = await apiSvc.updateAccount(
        currentUser.id, newFirstname, newLastname, newPassword);

    if (ret) {
      if (newFirstname != null) currentUser.firstname = newFirstname;
      if (newLastname != null) currentUser.lastname = newLastname;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('user', jsonEncode(_currentUser));
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
    bool ret = await apiSvc.updateAccount(
        selectedUser.id, newFirstname, newLastname, newPassword);

    if (ret) {
      if (newFirstname != null) selectedUser.firstname = newFirstname;
      if (newLastname != null) selectedUser.lastname = newLastname;
    }
    return ret;
  }
}
