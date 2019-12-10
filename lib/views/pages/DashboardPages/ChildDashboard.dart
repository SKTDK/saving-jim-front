import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/ChildDashboardViewModel.dart';
import 'package:saving_jim/views/pages/ChildDashboard/GamesPage.dart';
import 'package:saving_jim/views/pages/Login/LoginPage.dart';

class ChildDashboard extends StatefulWidget {
  final ChildDashboardViewModel viewModel;
  ChildDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ChildDashboardState createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilisateur',
      theme: ThemedApp.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Utilisateur'),
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
                        "Bienvenue :)",
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
                                GamesPage(viewModel: gameListViewModel)));
                  },
                  title: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Afficher mes parties',
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
                    colors: ThemedApp.secondaryGradient,
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
