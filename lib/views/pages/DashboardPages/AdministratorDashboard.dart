import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/Dashboards/AdministratorDashboardViewModel.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/AccountEditorPage.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/AccountStatePage.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/AddManagerPage.dart';
import 'package:saving_jim/views/pages/AdministratorDashboard/StatisticsPage.dart';
import 'package:saving_jim/views/pages/Login/LoginPage.dart';

class AdministratorDashboard extends StatefulWidget {
  final AdministratorDashboardViewModel viewModel;
  AdministratorDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _AdministratorDashboardState createState() => _AdministratorDashboardState();
}

class _AdministratorDashboardState extends State<AdministratorDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard admin',
      theme: ThemedApp.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Administrateur'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                color: Theme.of(context).backgroundColor,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Center(
                      child: Text(
                        widget.viewModel.user == null
                            ? "Bienvenue"
                            : "Bienvenue, " + widget.viewModel.user.firstname,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Theme.of(context).primaryColor, height: 0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.blueGrey[800],
                      Colors.blueGrey[700],
                      Colors.blueGrey[600],
                      Colors.blueGrey[400],
                    ],
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddManagerPage(
                                viewModel: addManagerViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Créer un compte accompagnateur',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: ThemedApp.primaryGradient,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountStatePage(
                                viewModel: accountStateViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text('Activer ou désactiver un compte',
                            style: Theme.of(context).textTheme.title),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.blueGrey[800],
                      Colors.blueGrey[700],
                      Colors.blueGrey[600],
                      Colors.blueGrey[400],
                    ],
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountEditorPage(
                                viewModel: accountEditorViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Modifier un compte',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: ThemedApp.primaryGradient,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatisticsPage(
                                viewModel: statisticsViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Statistiques',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.blueGrey[800],
                      Colors.blueGrey[700],
                      Colors.blueGrey[600],
                      Colors.blueGrey[400],
                    ],
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    widget.viewModel.clearPreferences(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(viewModel: loginPageViewModel)),
                        (r) => false);
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Se déconnecter',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
