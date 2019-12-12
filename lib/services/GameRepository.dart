import 'package:saving_jim/models/Game.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/services/HabitRepository.dart';

class GameRepository {
  static final GameRepository _instance = GameRepository._internal();
  static final ApiService apiSvc = ApiService();
  Map<String, GameModel> gameHistoryMap;
  Map<String, GameModel> gameOpenMap;

  factory GameRepository() {
    return _instance;
  }

  GameRepository._internal() {
    GameModel gm = new GameModel();
    gm.addCategories(apiSvc.fetchCategories());
    gm.addHabits(HabitRepository().getHabits());
    gm.childId = '1';
    gameOpenMap = new Map();
    gameOpenMap[gm.childId] = gm;
  }

  GameModel getCurrentOpenGame(String childId) {
    return gameOpenMap.values.firstWhere((i) => i.childId == childId);
  }
}
