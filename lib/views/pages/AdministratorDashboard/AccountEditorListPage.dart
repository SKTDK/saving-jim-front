import 'package:flutter/material.dart';
import 'package:saving_jim/views/widgets/AccountEditorItem.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';

class AccountEditorListPage extends StatefulWidget {
  final AccountEditorViewModel viewModel;
  AccountEditorListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  AccountEditor createState() => AccountEditor();
}

class AccountEditor extends State<AccountEditorListPage> {
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
              child: AccountEditorItem(
                  index, widget.viewModel.users[index], widget.viewModel),
            ),
        itemCount:
            widget.viewModel.users == null ? 0 : widget.viewModel.users.length);
  }
}
