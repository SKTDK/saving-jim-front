import 'package:flutter/material.dart';
import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/pages/GamePages/HabitsListPage.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(this.index, this.category, this.vm);

  final int index;
  final Category category;
  final GameViewModel vm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
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
          child: new Container(
            alignment: Alignment.centerLeft,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: new Image(
                      image: new AssetImage(category.image),
                      height: 600.0,
                      width: 600.0),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(category.name,
                          style: Theme.of(context).textTheme.title),
                      Text(category.description,
                          style: Theme.of(context).textTheme.body1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          vm.selectHabits(context, category);
        });
  }
}

// Center(
//         child: ListTile(
//           leading: SizedBox(
//             height: 100.0,
//             width: 100.0,
//             child: new Image(
//                 image: new AssetImage(category.image), fit: BoxFit.scaleDown),
//           ),
//           title: Text(category.name, style: Theme.of(context).textTheme.title),
//           subtitle: Text(category.description),
//           isThreeLine: true,
//           onTap: () {
//             // print(category.name);
//             vm.selectHabits(context, category);

//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => HabitsListPage(viewModel: vm)));
//           },
//         ),
//       ),
