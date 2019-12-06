import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/models/MenuEntry.dart';
import 'package:saving_jim/views/widgets/EntryItem.dart';
import 'package:saving_jim/view_models/ChildDashboardViewModel.dart';

class ChildDashboard extends StatefulWidget {
  final ChildDashboardViewModel viewModel;
  ChildDashboard({Key key, @required this.viewModel}) : super(key: key);

  @override
  _ChildDashboardState createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<ChildDashboardViewModel>(
          model: widget.viewModel, child: Menu()),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  List<MenuEntry> _entrySet;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChildDashboardViewModel>(
        builder: (context, child, model) {
      _entrySet = model.populateEntrySet();
      return SafeArea(
        child: Scaffold(
          body: _buildMenu(),
          appBar: AppBar(
            title: Text('Tableau de bord - Enfant'),
          ),
        ),
      );
    });
  }

// First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  Widget _buildMenu() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black45,
            ),
        itemBuilder: (BuildContext context, int index) => Center(
              child: EntryItem(_entrySet[index]),
            ),
        itemCount: _entrySet.length);
  }
}
