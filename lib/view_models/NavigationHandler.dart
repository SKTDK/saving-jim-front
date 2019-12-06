import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/ManagerDashboard.dart';
import 'package:saving_jim/views/pages/ChildDashboard.dart';
import 'package:saving_jim/views/pages/PersonOfContactDashboard.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard.dart';
import 'package:saving_jim/view_models/ManagerDashboardViewModel.dart';
import 'package:saving_jim/view_models/ChildDashboardViewModel.dart';
import 'package:saving_jim/view_models/PersonOfContactDashboardViewModel.dart';
import 'package:saving_jim/view_models/AdministratorDashboardViewModel.dart';
import 'package:saving_jim/services/ApiService.dart';

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
      case 0:
        _navigateToManagerDashboard(context);
        return;
      case 1:
        _navigateToChildDashboard(context);
        return;
      case 2:
        _navigateToPersonOfContactDashboard(context);
        return;
      case 3:
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
