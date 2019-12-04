import 'package:flutter/material.dart';
import 'MenuEntry.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This is the design of a single Entry item within a DashboardMenu
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

// We keep the Entry as an attribute
  final MenuEntry entry;

  Widget _buildTiles(MenuEntry root, BuildContext context) {
    return ListTile(
      onTap: () {
        if (!root.clearNavigation) {
          Navigator.push(context, root.route);
        } else {
          _clearPreferences(context);
          Navigator.pushAndRemoveUntil(context, root.route, (r) => false);
        }
      },
      title: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Text(
            root.title,
            style: TextStyle(
              fontSize: 40,
              letterSpacing: .09,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry, context);
  }

  void _clearPreferences(BuildContext context) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();
  }
}
