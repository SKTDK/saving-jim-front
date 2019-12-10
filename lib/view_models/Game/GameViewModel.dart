import 'package:flutter/material.dart';
import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/models/Habit.dart';
import 'package:saving_jim/views/pages/GamePages/HabitsListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';

class GameViewModel extends Model {
  final ApiService apiSvc;
  GameViewModel({@required this.apiSvc});

  Category _selectedCategory;
  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    notifyListeners();
  }

  User _user;
  User get user => _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  List<Category> _categories;
  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
    notifyListeners();
  }

  List<Habit> _habits;
  List<Habit> get habits => _habits;

  set habits(List<Habit> value) {
    _habits = value;
    notifyListeners();
  }

  List<Category> fetchCategories() {
    _categories = apiSvc.fetchCategories();
    return _categories;
  }

  void selectHabits(BuildContext context, Category selectedCategory) {
    this.selectedCategory = selectedCategory;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HabitsListPage(viewModel: this)));
  }

  List<Habit> fetchHabits(BuildContext context) {
    _habits = apiSvc.fetchHabits(selectedCategory.id);
    return _habits;
  }
}
