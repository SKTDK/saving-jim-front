import 'package:flutter/material.dart';
import 'package:saving_jim/models/Category.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/services/GameRepository.dart';
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/GamePages/LikeOrNotPage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SatisfiedOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SummaryPage.dart';
import 'package:saving_jim/views/widgets/HabitItem.dart';

class SelectHabitsPage extends StatefulWidget {
  final Category category;
  SelectHabitsPage({Key key, this.category}) : super(key: key);
  _SelectHabitsState createState() => _SelectHabitsState();
}

class _SelectHabitsState extends State<SelectHabitsPage> {
  int _selectedIndex = global.appBarIndexSelected;

  void _onItemTapped(int index) {
    var pages = [
      GameHomePage(),
      LikeOrNotPage(),
      NeedHelpOrNotPage(),
      SatisfiedOrNotPage(),
      SummaryPage()
    ];

    setState(() {
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }

  Widget build(BuildContext context) {
    final habits = new GameRepository()
        .getCurrentOpenGame("1")
        .getHabits()
        .where((i) => int.parse(i.categoryId) == widget.category.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Sélection des habitudes"),
        actions: <Widget>[
          FlatButton(
            child: Text('Suivant'),
            onPressed: () {
              _onItemTapped(1);
            },
          )
        ],
      ),
      body: Center(
          child: new GridView.builder(
              itemCount: habits.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return new HabitItem(habit: habits[index]);
              })),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Catégories'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('J\'aime'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('Besoin aide'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            title: Text('Satisfait'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            title: Text('Synthèse'),
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
