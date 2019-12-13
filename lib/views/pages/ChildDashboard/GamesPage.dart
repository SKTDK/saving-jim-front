import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/ChildDashboard/GameListViewModel.dart';

class GamesPage extends StatefulWidget {
  final GameListViewModel viewModel;

  GamesPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  Map<String, dynamic> formData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> accountTypes = [
    'Accompagnateur',
    'Enfant',
    'Personne de contact'
  ];

  Widget listview = Text("Liste");
  String selectedAccountType;

  @override
  Widget build(BuildContext context) {
    // TODO
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Chargement...'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
