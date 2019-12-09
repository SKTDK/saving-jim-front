import 'package:flutter/material.dart';
import 'package:saving_jim/views/pages/ChildDashboard/GameListPage.dart';
import 'package:saving_jim/models/Game.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

class GameListViewModel extends Model {
  final ApiService apiSvc;
  GameListViewModel({@required this.apiSvc});

  Future<List<Game>> _games;
  Future<List<Game>> get games => _games;
  set games(Future<List<Game>> value) {
    _games = value;
    notifyListeners();
  }

  Future<List<Game>> fetchGames(String type) async {
    int typeInt;
    switch (type) {
      case 'En cours':
        typeInt = constants.MANAGER_ACCOUNT_TYPE;
        break;
      case 'Terminee':
        typeInt = constants.CHILD_ACCOUNT_TYPE;
        break;
    }
    _games = apiSvc.fetchGames(typeInt);
    return _games;
  }

  void displayList(BuildContext context, String type) async {
    await fetchGames(type).then((result) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameListPage(viewModel: this, list: result)),
      );
    });
  }
}
