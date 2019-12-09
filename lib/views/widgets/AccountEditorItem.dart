import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/models/User.dart';

// This is the design of a single user item within the accountstate page
class AccountEditorItem extends StatelessWidget {
  const AccountEditorItem(this.user, this.vm);

  final User user;
  final AccountEditorViewModel vm;

  Widget _buildTiles(User root, BuildContext context) {
    return ScopedModelDescendant<AccountEditorViewModel>(
        builder: (context, child, model) {
      return Container(
        color: root.active ? Colors.greenAccent[100] : Colors.redAccent[100],
        child: ListTile(
          onTap: () {
            model.editUser(context, root);
          },
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color:
                root.active ? Colors.greenAccent[100] : Colors.redAccent[100],
            child: Center(
              child: Text(
                root.username == null ? "undefined" : root.username,
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
    return _buildTiles(user, context);
  }
}
