import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/MenuEntry.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/AddClientPage.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/StartNewGamePage.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/OverviewPage.dart';
import 'package:saving_jim/views/pages/Login/LoginPage.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

class ChildDashboardViewModel extends Model {
  final ApiService apiSvc;
  ChildDashboardViewModel({@required this.apiSvc});
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
