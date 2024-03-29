import 'package:flutter/material.dart';
import 'package:saving_jim/models/Habit.dart';

class HabitItem extends StatefulWidget {
  const HabitItem({Key key, this.habit, this.child}) : super(key: key);

  final Habit habit;
  final Widget child;

  _HabitItemState createState() => _HabitItemState();
}

class _HabitItemState extends State<HabitItem> {
  int _state = 0;
  var highlights = [
    [
      Colors.blueGrey[800],
      Colors.blueGrey[700],
      Colors.blueGrey[600],
      Colors.blueGrey[400],
    ],
    [
      Colors.green[800],
      Colors.green[700],
      Colors.green[600],
      Colors.green[400],
    ],
    [
      Colors.red[800],
      Colors.red[700],
      Colors.red[600],
      Colors.red[400],
    ],
    [
      Colors.lime[800],
      Colors.lime[700],
      Colors.lime[600],
      Colors.lime[400],
    ],
  ];

  void updateState(int newState) {
    _state = newState;
    this.widget.habit.state = _state;
  }

  @override
  Widget build(BuildContext context) {
    final image = new Image(
      image: new AssetImage(widget.habit.image),
      height: 300.0,
      width: 300.0,
    );

    final name =
        Text(widget.habit.name, style: Theme.of(context).textTheme.title);

    final description = Text(widget.habit.description);

    final item = Container(
      child: Column(
        children: <Widget>[name, description, Expanded(child: image)],
      ),
      // decoration: BoxDecoration(
      //     border:
      //         Border.all(color: highlights[this.widget.habit.state], width: 8)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 8),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: highlights[this.widget.habit.state],
        ),
      ),
    );

    return InkWell(
        child: item,
        onTap: () {
          _popupDialog(context, widget.habit);
        });
  }

  void _popupDialog(BuildContext context, Habit habit) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(habit.name, textAlign: TextAlign.center),
            children: <Widget>[
              Container(
                child: new Image(
                  image: new AssetImage(habit.image),
                  height: 300.0,
                  width: 300.0,
                ),
              ),
              Text("Cette habitude est ... ", textAlign: TextAlign.center),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(1),
                  child: Text('Présente')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(2),
                  child: Text('Absente')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(3),
                  child: Text('J\'aimerai')),
            ],
          );
        }).then((val) {
      if (val != null) {
        setState(() {
          this.updateState(val);
        });
      }
    });
  }
}
