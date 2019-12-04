import 'package:flutter/material.dart';

class MenuEntry {
  MenuEntry(this.title, this.widget, [this.children = const <MenuEntry>[]]);

  final String title;
  final List<MenuEntry> children;
  final Widget widget;
}
