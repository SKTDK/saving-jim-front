import 'package:flutter/material.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/GamePages/LikeOrNotPage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SatisfiedOrNot.dart';

class SummaryPage extends StatefulWidget {
  SummaryState createState() => SummaryState();
}

class SummaryState extends State<SummaryPage> {
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

  Widget body = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[Placeholder(), Placeholder()],
          ),
        )),
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[Placeholder(), Placeholder()],
          ),
        )),
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[Placeholder(), Placeholder()],
          ),
        ))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Synthèse"),
        ),
        body: body,
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
        ));
  }
}
