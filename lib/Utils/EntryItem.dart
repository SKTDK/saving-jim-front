import 'package:flutter/material.dart';
import 'MenuEntry.dart';

// This is the design of a single Entry item within a DashboardMenu
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

// We keep the Entry as an attribute
  final MenuEntry entry;

  Widget _buildTiles(MenuEntry root, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => entry.widget,
            ));
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
}
