import 'package:flutter/material.dart';

class MenuEntry {
  // optional attributes w/ default value in brackets []
  MenuEntry(this._title, this._route,
      [this._clearNavigation = false, this._clearPreferences = false]);

  final String _title;
  final MaterialPageRoute _route;
  final bool _clearNavigation;
  final bool _clearPreferences;

  String get title {
    return this._title;
  }

  MaterialPageRoute get route {
    return this._route;
  }

  bool get clearNavigation {
    return this._clearNavigation;
  }

  bool get clearPreferences {
    return this._clearPreferences;
  }
}
