import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/view_models/ManagerDashboard/CreateGameViewModel.dart';

// This is the design of a single user item within the accountstate page
class ChildListItem extends StatelessWidget {
  const ChildListItem(this.user, this.vm);

  final User user;
  final CreateGameViewModel vm;

  Widget _buildTiles(User root, BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          vm.createGame(root);
        },
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Center(
            child: Text(
              root.username,
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
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(user, context);
  }
}
