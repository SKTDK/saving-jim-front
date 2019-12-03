import 'package:flutter/material.dart';
import 'package:pfefront/widget/Survey/Categories/CategoryItem.dart';
import 'package:pfefront/data/CategoriesRepository.dart';

class SurveyHome extends StatelessWidget {
  
  final categories = new CategoriesRepository().getCategories();

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new CategoryItem(categories[index]),
                  childCount: categories.length,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


