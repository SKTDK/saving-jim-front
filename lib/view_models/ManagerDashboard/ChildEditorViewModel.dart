import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/ChildAccountEditorPage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/EditChildListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class ChildEditorViewModel extends Model {
  final ApiService apiSvc;
  ChildEditorViewModel({@required this.apiSvc});

  List<User> users;

  void changeState(User root) {
    apiSvc.changeAccountState(root).then((res) {
      root.active = !root.active;
      notifyListeners();
    });
  }

  void fetchChildren(BuildContext context) async {
    apiSvc.fetchUsers(constants.CHILD_ACCOUNT_TYPE).then((result) {
      users = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditChildListPage(viewModel: this)));
    });
  }

  void createGame(User root, BuildContext context) {
    //TODO
  }

  Future<List<User>> fetchSearchResult(String text) async {
    return apiSvc.fetchSearchResult(constants.CHILD_ACCOUNT_TYPE, text);
  }

  Future<List<User>> search(BuildContext context, String text) {
    return fetchSearchResult(text);
  }

  User selectedUser;
  void editUser(BuildContext context, User root) async {
    selectedUser = root;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScopedModel<ChildEditorViewModel>(
            model: this, child: ChildAccountEditorPage(viewModel: this)),
      ),
    );
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
    print(root.length);
    if (root.length == 1) {
      selectedUser = root[0];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<ChildEditorViewModel>(
              model: this, child: ChildAccountEditorPage(viewModel: this)),
        ),
      );
    } else if (root.length > 1) {
      users = root;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<ChildEditorViewModel>(
              model: this, child: EditChildListPage(viewModel: this)),
        ),
      );
    }
  }
}
