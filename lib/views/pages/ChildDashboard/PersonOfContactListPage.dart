import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/ChildDashboard/PersonOfContactListViewModel.dart';
import 'package:saving_jim/views/widgets/ChildListItem.dart';
import 'package:saving_jim/views/widgets/PersonOfContactListItem.dart';

class PersonOfContactListPage extends StatefulWidget {
  final PersonOfContactListViewModel viewModel;

  PersonOfContactListPage({Key key, @required this.viewModel})
      : super(key: key);

  @override
  _PersonOfContact createState() => _PersonOfContact();
}

class _PersonOfContact extends State<PersonOfContactListPage> {
  var searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildMenu(),
        appBar: AppBar(
          title: Text('Liste des personnes de contact'),
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
              child: PersonOfContactListItem(
                  index, widget.viewModel.users[index], widget.viewModel),
            ),
        itemCount:
            widget.viewModel.users == null ? 0 : widget.viewModel.users.length);
  }
}
