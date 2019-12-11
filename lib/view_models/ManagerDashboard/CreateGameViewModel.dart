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
  List<User> users;

  void fetchChildren(BuildContext context) async {
    apiSvc.fetchUsers(constants.CHILD_ACCOUNT_TYPE).then((result) {
      users = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateGameListPage(viewModel: this)));
    });
  }

  Future<List<User>> fetchSearchResult(String text) async {
    return apiSvc.fetchSearchResult(constants.CHILD_ACCOUNT_TYPE, text);
  }

  Future<List<User>> search(BuildContext context, String text) {
    return fetchSearchResult(text);
  }

  User selectedUser;
  void editUser(BuildContext context, User root) {}

  void createGame(User root, BuildContext context) {
    selectedUser = root;
    gameViewModel.user = root;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoriesListPage(viewModel: gameViewModel),
        ));
  }

  void redirect(BuildContext context, List<User> root) {
    print(root.length);
    if (root.length == 1) {
      selectedUser = root[0];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateGameListPage(viewModel: this),
        ),
      );
    } else if (root.length > 1) {
      users = root;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CreateGameListPage(viewModel: this),
        ),
      );
    }
  }
}
