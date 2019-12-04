import 'package:flutter/material.dart';
import '../../Utils/MenuEntry.dart';
import '../../Utils/EntryItem.dart';
import '../../Utils/Logout.dart';
import 'AddClientPage.dart';
import 'StartNewGamePage.dart';
import 'OverviewPage.dart';

class ManagerDashboard extends StatefulWidget {
  @override
  _ManagerDashboardState createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  final List<MenuEntry> _entrySet = _populateEntrySet();

  @override
  Widget build(BuildContext context) {
    _populateEntrySet();
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
              child: EntryItem(_entrySet[index]),
            ),
        itemCount: _entrySet.length);
  }

// We populate the Menu with new Entries (Display name, Widget)
  static List<MenuEntry> _populateEntrySet() {
    List<MenuEntry> e = <MenuEntry>[
      MenuEntry('Ajouter un client', AddClientPage()),
      MenuEntry('Lancer une nouvelle partie', StartNewGamePage()),
      MenuEntry('Vue d\'ensemble', OverviewPage()),
      MenuEntry('Se déconnecter', Logout()),
    ];
    return e;
  }
}
