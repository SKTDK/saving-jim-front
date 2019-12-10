import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/ManagerDashboard/EditChildViewModel.dart';

// This is the design of a single user item within the accountstate page
class EditChildListItem extends StatelessWidget {
  const EditChildListItem(this.index, this.user, this.vm);
  final int index;
  final User user;
  final EditChildViewModel vm;

  Widget _buildTiles(User root, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: index % 2 == 0
              ? ThemedApp.primaryGradient
              : ThemedApp.secondaryGradient,
        ),
      ),
      child: ListTile(
        onTap: () {
          vm.createGame(root, context);
        },
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Center(
            child: Text(root.username,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title),
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
