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
  var highlights = [Colors.grey, Colors.green, Colors.red, Colors.lime];

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

    final name = Text(widget.habit.name);

    final description = Text(widget.habit.description);

    final item = Container(
      child: Column(
        children: <Widget>[name, description, Expanded(child: image)],
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: highlights[this.widget.habit.state], width: 8)),
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
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(1),
                  child: Text('Présent')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(2),
                  child: Text('Absent')),
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
