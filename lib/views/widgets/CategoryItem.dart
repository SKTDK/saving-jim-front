import 'package:flutter/material.dart';
import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/views/pages/GamePages/SelectHabitsPage.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  CategoryItem(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    final image = new Image(
      image: new AssetImage(category.image),
      height: 600.0,
      width: 600.0,
    );

    final name = new Text(category.name, textAlign: TextAlign.center);

    final description =
        new Text(category.description, textAlign: TextAlign.center);

    final item = new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: index % 2 == 0
                ? ThemedApp.primaryGradient
                : ThemedApp.secondaryGradient,
          ),
        ),
        height: 300,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: image),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[name, description],
            ))
          ],
        ));

    return Material(
        child: InkWell(
            child: item,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectHabitsPage(category: category)));
            }));
  }
}
