import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/DashboardPages/ManagerDashboard.dart';
import 'package:saving_jim/views/pages/DashboardPages/ChildDashboard.dart';
import 'package:saving_jim/views/pages/DashboardPages/PersonOfContactDashboard.dart';
import 'package:saving_jim/views/pages/DashboardPages/AdministratorDashboard.dart';
import 'package:saving_jim/view_models/ManagerDashboardViewModel.dart';
import 'package:saving_jim/view_models/ChildDashboardViewModel.dart';
import 'package:saving_jim/view_models/PersonOfContactDashboardViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboardViewModel.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

final ManagerDashboardViewModel managerDashboardViewModel =
    ManagerDashboardViewModel(apiSvc: ApiService());

final ChildDashboardViewModel childDashboardViewModel =
    ChildDashboardViewModel(apiSvc: ApiService());

final PersonOfContactDashboardViewModel personOfContactDashboardViewModel =
    PersonOfContactDashboardViewModel(apiSvc: ApiService());

final AdministratorDashboardViewModel administratorDashboardViewModel =
    AdministratorDashboardViewModel(apiSvc: ApiService());

abstract class NavigationHandler {
  static void handleNavigation(BuildContext context, int privilege) {
    switch (privilege) {
      case constants.MANAGER_ACCOUNT_TYPE:
        _navigateToManagerDashboard(context);
        return;
      case constants.CHILD_ACCOUNT_TYPE:
        _navigateToChildDashboard(context);
        return;
      case constants.PERSONOFCONTACT_ACCOUNT_TYPE:
        _navigateToPersonOfContactDashboard(context);
        return;
      case constants.ADMINISTRATOR_ACCOUNT_TYPE:
        _navigateToAdministratorDashboard(context);
        return;
    }
  }

  static void _navigateToManagerDashboard(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ManagerDashboard(viewModel: managerDashboardViewModel),
        ),
        (r) => false);
  }

  static void _navigateToChildDashboard(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChildDashboard(viewModel: childDashboardViewModel),
        ),
        (r) => false);
  }

  static void _navigateToPersonOfContactDashboard(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PersonOfContactDashboard(
              viewModel: personOfContactDashboardViewModel),
        ),
        (r) => false);
  }

  static void _navigateToAdministratorDashboard(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AdministratorDashboard(
              viewModel: administratorDashboardViewModel),
        ),
        (r) => false);
  }
}
