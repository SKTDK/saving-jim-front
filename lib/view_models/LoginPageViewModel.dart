import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/view_models/NavigationHandler.dart';

class LoginPageViewModel extends Model {
  final ApiService apiSvc;
  LoginPageViewModel({@required this.apiSvc});

  User _currentUser;
  User get currentUser => _currentUser;
  set currentUser(User value) {
    currentUser = value;
    notifyListeners();
  }

  Future<bool> setUser(
      BuildContext context, String username, String password) async {
    _currentUser = await apiSvc.login(username, password);

    if (_currentUser == null) {
      return false;
    } else {
      NavigationHandler.handleNavigation(context, _currentUser.accountType);
      return true;
    }
  }
}
