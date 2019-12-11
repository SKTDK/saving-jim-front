import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';
import 'package:saving_jim/models/User.dart';

class AccountStateListItem extends StatefulWidget {
  final AccountStateViewModel viewModel;
  final User user;
  AccountStateListItem({Key key, @required this.viewModel, @required this.user})
      : super(key: key);

  @override
  AccountStateItem createState() => AccountStateItem();
}

// This is the design of a single user item within the accountstate page
class AccountStateItem extends State<AccountStateListItem> {
  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.user, context);
  }

  Widget _buildTiles(User root, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: root.active
              ? [
                  Colors.green[800],
                  Colors.green[700],
                  Colors.green[600],
                  Colors.green[400],
                ]
              : [
                  Colors.red[800],
                  Colors.red[700],
                  Colors.red[600],
                  Colors.red[400],
                ],
        ),
      ),
      child: ListTile(
        onTap: () {
          widget.viewModel.changeState(root).then((result) {
            setState(() {});
          });
        },
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
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
  }
}
