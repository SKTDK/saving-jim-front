import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/services/GameRepository.dart';
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/GamePages/LikeOrNotPage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SummaryPage.dart';
import 'package:saving_jim/views/widgets/HabitItemSatisfied.dart';

class SatisfiedOrNotPage extends StatefulWidget {
  SatisfiedOrNotState createState() => SatisfiedOrNotState();
}

class SatisfiedOrNotState extends State<SatisfiedOrNotPage> {
  var _selectedHabits;
  @override
  void initState() {
    _selectedHabits = GameRepository()
        .getCurrentOpenGame("1")
        .getHabits()
        .where((i) => i.state == 1 || i.state == 3)
        .toList();
    super.initState();
  }

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
      if (global.previousState != _selectedIndex) {
        global.previousState = _selectedIndex;
      }
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _noActionTaken =
        _selectedHabits.where((i) => i.satisfiedOrNot == null).toList();
    var _satisfied =
        _selectedHabits.where((i) => i.satisfiedOrNot == true).toList();
    var _notSatisfied =
        _selectedHabits.where((i) => i.satisfiedOrNot == false).toList();

    BoxDecoration columnDecoration =
        BoxDecoration(border: Border.all(width: 2, color: Colors.black));

    Widget _noActionTakenLabel = Container(
        height: 150,
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        width: double.infinity,
        child: Center(
          child: Text(
            "En attente d'action",
            textAlign: TextAlign.center,
          ),
        ));

    Widget _satisfiedLabel = Container(
        height: 150,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: SizedBox(
            child: new Image(
              image: new AssetImage('assets/img/labels/happyface.png'),
            ),
            height: 150));

    Widget _notSatisfiedLabel = Container(
        height: 150,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: SizedBox(
            child: new Image(
              image: new AssetImage('assets/img/labels/sadface.png'),
            ),
            height: 150));

    Widget _noActionTakenWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            child: ListView.builder(
              itemCount: _noActionTaken.length,
              itemBuilder: (context, index) {
                return new HabitItemSatisfied(
                    habit: _noActionTaken[index], parent: this);
              },
            )));

    Widget _satisfiedWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            child: ListView.builder(
              itemCount: _satisfied.length,
              itemBuilder: (context, index) {
                return new HabitItemSatisfied(
                    habit: _satisfied[index], parent: this);
              },
            )));

    Widget _notSatisfiedWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            child: ListView.builder(
              itemCount: _notSatisfied.length,
              itemBuilder: (context, index) {
                return new HabitItemSatisfied(
                    habit: _notSatisfied[index], parent: this);
              },
            )));

    return Scaffold(
      appBar: AppBar(
        title: Text("Satisfait ou pas"),
        actions: <Widget>[
          FlatButton(
            child: Text('Suivant'),
            textColor: Colors.white,
            onPressed: () {
              _onItemTapped(4);
            },
          )
        ],
      ),
      body: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: ThemedApp.secondaryGradient,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          _noActionTakenLabel,
                          _noActionTakenWidget
                        ],
                      ))),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Colors.green[800],
                            Colors.green[700],
                            Colors.green[600],
                            Colors.green[400],
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[_satisfiedLabel, _satisfiedWidget],
                      ))),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Colors.red[800],
                            Colors.red[700],
                            Colors.red[600],
                            Colors.red[400],
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          _notSatisfiedLabel,
                          _notSatisfiedWidget
                        ],
                      ))),
            ]),
      ),
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
