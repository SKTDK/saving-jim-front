import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/PersonOfContact/PersonOfContactListViewModel.dart';
import 'package:saving_jim/views/widgets/ContactChildListItem.dart';

class ContactChildListPage extends StatefulWidget {
  final ContactChildListViewModel viewModel;

  ContactChildListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ContactChild createState() => _ContactChild();
}

class _ContactChild extends State<ContactChildListPage> {
  var searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildMenu(),
        appBar: AppBar(
          title: Text('Liste des enfants'),
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
              child: ContactChildListItem(
                  index, widget.viewModel.users[index], widget.viewModel),
            ),
        itemCount:
            widget.viewModel.users == null ? 0 : widget.viewModel.users.length);
  }
}
