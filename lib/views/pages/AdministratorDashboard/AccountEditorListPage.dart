import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/views/widgets/AccountEditorItem.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';

class AccountEditorListPage extends StatefulWidget {
  final AccountEditorViewModel viewModel;
  final List<User> list;
  AccountEditorListPage(
      {Key key, @required this.viewModel, Key key2, @required this.list})
      : super(key: key);

  @override
  AccountEditor createState() => AccountEditor();
}

class AccountEditor extends State<AccountEditorListPage> {
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
        separatorBuilder: (context, index) =>
            Divider(color: Colors.black45, thickness: 2.0, height: 0),
        itemBuilder: (BuildContext context, int index) => Center(
              child: AccountEditorItem(widget.list[index], widget.viewModel),
            ),
        itemCount: widget.list == null ? 0 : widget.list.length);
  }
}
