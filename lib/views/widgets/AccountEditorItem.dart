import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/models/User.dart';

// This is the design of a single user item within the accountstate page
class AccountEditorItem extends StatelessWidget {
  const AccountEditorItem(this.index, this.user, this.vm);

  final User user;
  final AccountEditorViewModel vm;
  final int index;

  Widget _buildTiles(User root, BuildContext context) {
    return ScopedModelDescendant<AccountEditorViewModel>(
        builder: (context, child, model) {
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
            model.editUser(context, root);
          },
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: Text(
                root.username == null ? "undefined" : root.username,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(user, context);
  }
}
