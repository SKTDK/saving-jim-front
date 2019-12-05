import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import '../models/MenuEntry.dart';
import '../views/widgets/ManagerDashboard/AddClientPage.dart';
import '../views/widgets/ManagerDashboard/StartNewGamePage.dart';
import '../views/widgets/ManagerDashboard/OverviewPage.dart';
import '../views/pages/LoginPage.dart';
import '../services/apiService.dart';
import 'LoginPageViewModel.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

class ManagerDashboardViewModel extends Model {
  final ApiService apiSvc;
  ManagerDashboardViewModel({@required this.apiSvc});
// TODO
  List<MenuEntry> populateEntrySet() {
    List<MenuEntry> e = <MenuEntry>[
      MenuEntry(
        'Créer un compte utilisateur',
        MaterialPageRoute(builder: (context) => AddClientPage()),
      ),
      MenuEntry(
        'Créer une nouvelle partie',
        MaterialPageRoute(builder: (context) => StartNewGamePage()),
      ),
      MenuEntry(
        'Comparer des parties',
        MaterialPageRoute(builder: (context) => OverviewPage()),
      ),
      MenuEntry(
          'Se déconnecter',
          MaterialPageRoute(
            builder: (context) => LoginPage(viewModel: loginPageViewModel),
          ),
          true,
          true),
    ];
    return e;
  }
}
