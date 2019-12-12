import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/models/Habit.dart';

class GameModel {
  String id;
  String workerId;
  String childId;
  DateTime date;

  //will be under 'DATA' in the database
  Map<String, Category> categoryMap;
  Map<String, Habit> habitMap;
  String commentHelpOrNot;
  String commentSatisfiedOrNot;
  String commentSummary;

  GameModel() {
    categoryMap = new Map();
    habitMap = new Map();
  }

  GameModel getModel() {
    return this;
  }

  void addCategory(Category category) {
    categoryMap[category.id.toString()] = category;
  }

  void addCategories(List<Category> categories) {
    for (Category elem in categories) {
      addCategory(elem);
    }
  }

  void addHabit(Habit habit) {
    habitMap[habit.id] = habit;
  }

  void addHabits(List<Habit> list) {
    for (Habit elem in list) {
      addHabit(elem);
    }
  }

  List<Category> getCategories() {
    return categoryMap.values.toList();
  }

  List<Habit> getHabits() {
    return habitMap.values.toList();
  }
}
