import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/views/pages/Login/LoginPage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/AddChildPage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/CreateGameListPage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/EditChildListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/view_models/ManagerDashboardViewModel.dart';

class ManagerDashboard extends StatefulWidget {
  final ManagerDashboardViewModel viewModel;
  ManagerDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ManagerDashboardState createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Accompagnateur',
      theme: ThemedApp.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard Accompagnateur'),
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
                        "Bienvenue",
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
                    colors: ThemedApp.secondaryGradient,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddChildPage(viewModel: addChildViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Ajouter un enfant',
                          style: Theme.of(context).textTheme.title,
                        ),
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
                    colors: ThemedApp.primaryGradient,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditChildListPage(
                                viewModel: editChildViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Modifier un enfant',
                          style: Theme.of(context).textTheme.title,
                        ),
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
                    colors: ThemedApp.secondaryGradient,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateGameListPage(
                                viewModel: createGameViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Créer une partie',
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
