import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/MenuEntry.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/AddClientPage.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/StartNewGamePage.dart';
import 'package:saving_jim/views/widgets/ManagerDashboard/OverviewPage.dart';
import 'package:saving_jim/views/pages/LoginPage.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: ApiService());

class AdministratorDashboardViewModel extends Model {
  final ApiService apiSvc;
  AdministratorDashboardViewModel({@required this.apiSvc});
// TODO
  List<MenuEntry> populateEntrySet() {
    List<MenuEntry> e = <MenuEntry>[
      MenuEntry(
        'Créer un compte accompagnateur',
        MaterialPageRoute(builder: (context) => AddClientPage()),
      ),
      MenuEntry(
        'Cloturer un compte',
        MaterialPageRoute(builder: (context) => StartNewGamePage()),
      ),
      MenuEntry(
        'Modifier un compte',
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
