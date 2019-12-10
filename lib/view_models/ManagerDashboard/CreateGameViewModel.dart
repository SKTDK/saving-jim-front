import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/pages/GamePages/CategoriesListPage.dart';
import 'package:saving_jim/views/pages/ManagerDashboard/CreateGameListPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/services/ApiService.dart';
import 'package:saving_jim/utils/constants.dart' as constants;

final GameViewModel gameViewModel = GameViewModel(apiSvc: ApiService());

class CreateGameViewModel extends Model {
  final ApiService apiSvc;
  CreateGameViewModel({@required this.apiSvc});
  final GameViewModel gameViewModel = GameViewModel(apiSvc: ApiService());
  Future<List<User>> _users;
  Future<List<User>> get users => _users;
  set users(Future<List<User>> value) {
    _users = value;
    notifyListeners();
  }

  void displayList(BuildContext context, String accountType) async {
    await fetchChildren().then((result) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScopedModel<CreateGameViewModel>(
              model: this, child: CreateGameListPage(viewModel: this)),
        ),
      );
    });
  }

  void changeState(User root) {
    apiSvc.changeAccountState(root).then((res) {
      root.active = !root.active;
      notifyListeners();
    });
  }

  Future<List<User>> fetchChildren() async {
    _users = apiSvc.fetchUsers(constants.CHILD_ACCOUNT_TYPE);
    return _users;
  }

  void createGame(User root, BuildContext context) {
    gameViewModel.user = root;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoriesListPage(viewModel: gameViewModel),
        ));
  }
}