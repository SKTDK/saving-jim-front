import 'package:flutter/material.dart';
import 'package:saving_jim/services/GameRepository.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/pages/GamePages/LikeOrNotPage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SatisfiedOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SummaryPage.dart';
import 'package:saving_jim/views/widgets/CategoryItem.dart';
import 'package:saving_jim/views/widgets/HabitItem.dart';

class GameHomePage extends StatefulWidget {
  final categories =
      new GameRepository().getCurrentOpenGame("1").getCategories();
  final GameViewModel viewModel;
  GameHomePage({Key key, @required this.viewModel}) : super(key: key);

  _GameHomeState createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHomePage> {
  int _selectedIndex = global.appBarIndexSelected;

  void _onItemTapped(int index) {
    var pages = [
      GameHomePage(viewModel: widget.viewModel),
      LikeOrNotPage(),
      NeedHelpOrNotPage(),
      SatisfiedOrNotPage(),
      SummaryPage()
    ];

    setState(() {
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => pages[_selectedIndex]),
          (r) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var listview = ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(widget.categories[index], index);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Sélection des catégories"),
      ),
      body: Center(child: listview),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
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
