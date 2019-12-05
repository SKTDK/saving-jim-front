import 'package:flutter/material.dart';

class MenuEntry {
  MenuEntry(this.title, this.route,
      [this.clearNavigation = false, this.clearPreferences = false]);

  final String title;
  final MaterialPageRoute route;
  final bool clearNavigation;
  final bool clearPreferences;
}
