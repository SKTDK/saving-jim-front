import 'package:flutter/material.dart';
import 'package:saving_jim/models/Game.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';
import 'package:saving_jim/view_models/ChildDashboard/GameListViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/models/User.dart';

// This is the design of a single user item within the accountstate page
class GameListItem extends StatelessWidget {
  const GameListItem(this.game, this.vm);

  final Game game;
  final GameListViewModel vm;

  Widget _buildTiles(Game root, BuildContext context) {
    return ScopedModelDescendant<AccountStateViewModel>(
        builder: (context, child, model) {
      return Container(
        child: ListTile(
          onTap: () {},
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: Text(
                root.workerId.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: .09,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(game, context);
  }
}
