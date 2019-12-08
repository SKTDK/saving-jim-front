import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/views/widgets/AccountTypeItem.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';

class AccountStateListPage extends StatefulWidget {
  final AccountStateViewModel viewModel;
  final List<User> list;
  AccountStateListPage(
      {Key key, @required this.viewModel, Key key2, @required this.list})
      : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<AccountStateListPage> {
  List<User> list;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildMenu(),
        appBar: AppBar(
          title: Text('Tableau de bord - Administrateur'),
        ),
      ),
    );
  }

// First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  Widget _buildMenu() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black45,
            ),
        itemBuilder: (BuildContext context, int index) => Center(
              child: AccountTypeItem(widget.list[index], widget.viewModel),
            ),
        itemCount: widget.list == null ? 0 : widget.list.length);
  }
}
