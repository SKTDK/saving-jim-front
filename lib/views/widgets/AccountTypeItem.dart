import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/models/User.dart';

// This is the design of a single user item within the accountstate page
class AccountTypeItem extends StatelessWidget {
  const AccountTypeItem(this.user, this.vm);

  final User user;
  final AccountStateViewModel vm;

  Widget _buildTiles(User root, BuildContext context) {
    return ScopedModelDescendant<AccountStateViewModel>(
        builder: (context, child, model) {
      return ListTile(
        onTap: () {
          model.changeState(root);
        },
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: root.active ? Colors.greenAccent[100] : Colors.redAccent[100],
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
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(user, context);
  }
}
