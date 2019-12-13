import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/utils/global.dart' as global;
import 'package:saving_jim/views/pages/GamePages/GameHomePage.dart';
import 'package:saving_jim/views/pages/GamePages/LikeOrNotPage.dart';
import 'package:saving_jim/views/pages/GamePages/NeedHelpOrNot.dart';
import 'package:saving_jim/views/pages/GamePages/SatisfiedOrNot.dart';
import 'package:saving_jim/services/GameRepository.dart';
import 'package:saving_jim/views/widgets/HabitItemSummary.dart';

class SummaryPage extends StatefulWidget {
  SummaryState createState() => SummaryState();
}

class SummaryState extends State<SummaryPage> {
  int _selectedIndex = global.appBarIndexSelected;
  var _selectedHabits;
  var _selectedCategories;

  Widget _buildLabel(String text, String imgPath) {
    return SizedBox(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          // SizedBox(
          //   child: Text(text, textAlign: TextAlign.center),
          //   height: 50,
          // ),
          Image(
            image: new AssetImage(imgPath),
            height: 50,
            colorBlendMode: BlendMode.dstOver,
          )
        ]));
  }

  @override
  void initState() {
    super.initState();
  }

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
    _selectedHabits = GameRepository()
        .getCurrentOpenGame("1")
        .getHabits()
        .where((i) => i.state == 1 || i.state == 3)
        .toList();
    var _categoriesId = new Set();
    _selectedHabits.forEach((i) => _categoriesId.add(i.categoryId));

    _selectedCategories = GameRepository()
        .getCurrentOpenGame("1")
        .getCategories()
        .where((i) => _categoriesId.contains(i.id.toString()))
        .toList();

    var _categoriesString = "";
    _selectedCategories
        .forEach((i) => _categoriesString = _categoriesString + i.name + " & ");
    _categoriesString =
        _categoriesString.substring(0, _categoriesString.length - 3);

    Widget titlePageWidget = SizedBox(
        height: 100,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("catégories", textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text(
                _categoriesString,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));

    Widget listViewLabel = SizedBox(
        height: 250,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("N°", textAlign: TextAlign.center),
            ),
            Expanded(child: Text("habitude", textAlign: TextAlign.center)),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text("Valeur", textAlign: TextAlign.center),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 100,
                              child: _buildLabel("J'aime",
                                  'assets/img/labels/smilingheart.png'))),
                      Expanded(
                          child: SizedBox(
                              height: 100,
                              child: _buildLabel("J'aime pas",
                                  'assets/img/labels/sadheart.png')))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text("Aide", textAlign: TextAlign.center),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 100,
                              child: _buildLabel("Avec Aide",
                                  'assets/img/labels/needhelp.png'))),
                      Expanded(
                          child: SizedBox(
                              height: 100,
                              child: _buildLabel("Sans aide",
                                  'assets/img/labels/noneedhelp.png')))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text("Satisfait", textAlign: TextAlign.center),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                            height: 100,
                            child: _buildLabel(
                                "Content", 'assets/img/labels/happyface.png'))),
                    Expanded(
                        child: SizedBox(
                            height: 100,
                            child: _buildLabel("Pas content",
                                'assets/img/labels/sadface.png')))
                  ],
                )
              ],
            )),
            Expanded(
              child:
                  Text("habitudes prioritaires", textAlign: TextAlign.center),
            )
          ],
        ));

    Widget listViewWidget = Expanded(
        child: ListView.builder(
      itemCount: _selectedHabits.length,
      itemBuilder: (context, index) {
        return new HabitItemSummary(
            habit: _selectedHabits[index], number: index);
      },
    ));

    Widget body = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: ThemedApp.secondaryGradient,
        ),
      ),
      child: Column(
        children: <Widget>[titlePageWidget, listViewLabel, listViewWidget],
      ),
    );

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
