import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'ManagerDashboardViewModel.dart';
import '../models/User.dart';
import '../views/pages/ManagerDashboard.dart';
import '../services/apiService.dart';

final ManagerDashboardViewModel managerDashboardViewModel =
    ManagerDashboardViewModel(apiSvc: ApiService());

class LoginPageViewModel extends Model {
  final ApiService apiSvc;
  LoginPageViewModel({@required this.apiSvc});

  User _currentUser;
  User get currentUser => _currentUser;
  set currentUser(User value) {
    currentUser = value;
    notifyListeners();
  }

  void setUser(BuildContext context, String username, String password) async {
    _currentUser = await apiSvc?.login(username, password);
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ManagerDashboard(viewModel: managerDashboardViewModel),
        ),
        (r) => false);
  }
}
