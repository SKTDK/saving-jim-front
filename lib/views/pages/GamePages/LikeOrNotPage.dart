import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/services/GameRepository.dart';
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SatisfiedOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SummaryPage.dart';
import 'package:saving_jim/views/widgets/HabitItemLike.dart';

class LikeOrNotPage extends StatefulWidget {
  LikeOrNotState createState() => LikeOrNotState();
}

class LikeOrNotState extends State<LikeOrNotPage> {
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
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _noActionTaken =
        _selectedHabits.where((i) => i.likedOrNot == null).toList();
    var _liked = _selectedHabits.where((i) => i.likedOrNot == true).toList();
    var _notLiked =
        _selectedHabits.where((i) => i.likedOrNot == false).toList();

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

    Widget _likedLabel = Container(
        height: 150,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: SizedBox(
            child: new Image(
              image: new AssetImage('assets/img/labels/smilingheart.png'),
            ),
            height: 150));

    Widget _notLikedLabel = Container(
        height: 150,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: SizedBox(
            child: new Image(
              image: new AssetImage('assets/img/labels/sadheart.png'),
            ),
            height: 150));

    Widget _noActionTakenWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            child: ListView.builder(
              itemCount: _noActionTaken.length,
              itemBuilder: (context, index) {
                return new HabitItemLike(
                    habit: _noActionTaken[index],
                    parent: this);
              },
            )));

    Widget _likedWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            child: ListView.builder(
              itemCount: _liked.length,
              itemBuilder: (context, index) {
                return new HabitItemLike(habit: _liked[index], parent: this);
              },
            )));

    Widget _notLikedWidget = Expanded(
        child: Container(
            decoration: columnDecoration,
            height: double.infinity,
            child: ListView.builder(
              itemCount: _notLiked.length,
              itemBuilder: (context, index) {
                return new HabitItemLike(habit: _notLiked[index], parent: this);
              },
            )));

    return Scaffold(
      appBar: AppBar(
        title: Text("J'aime ou pas"),
        actions: <Widget>[
          FlatButton(
            child: Text('Suivant'),
            textColor: Colors.white,
            onPressed: () {
              _onItemTapped(2);
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[_likedLabel, _likedWidget],
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
                        children: <Widget>[_notLikedLabel, _notLikedWidget],
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
            backgroundColor: Colors.blue,
            title: Text('Satisfait'),
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
