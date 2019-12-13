import 'package:flutter/material.dart';
import 'package:saving_jim/models/Habit.dart';

class HabitItemSummary extends StatefulWidget {
  HabitItemSummary({Key key, this.number, this.habit, this.child})
      : super(key: key);

  final Habit habit;
  final Widget child;
  final int number;

  _HabitItemSummaryState createState() => _HabitItemSummaryState();
}

class _HabitItemSummaryState extends State<HabitItemSummary> {
  Widget _buildIcon(String imgPath) {
    return new Image(
      image: AssetImage(imgPath),
      height: 50,
      colorBlendMode: BlendMode.dstOver,
    );
  }

  Widget _giveIconIfTrue(bool cond, imgPath) {
    if (cond == true) {
      return _buildIcon(imgPath);
    } else {
      return Visibility(visible: false, child: SizedBox(width: 50));
    }
  }

  Widget _giveIconIfFalse(bool cond, String imgPath) {
    if (cond == false) {
      return _buildIcon(imgPath);
    } else {
      return Visibility(visible: false, child: SizedBox(width: 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    final numeroWidget = Expanded(
        child:
            Text((widget.number + 1).toString(), textAlign: TextAlign.center));

    final nameWidget =
        Expanded(child: Text(widget.habit.name, textAlign: TextAlign.center));

    final likeOrNotWidget = Expanded(
        child: SizedBox(
            height: 200,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _giveIconIfTrue(widget.habit.likedOrNot,
                        'assets/img/labels/smilingheart.png')),
                Expanded(
                    child: _giveIconIfFalse(widget.habit.likedOrNot,
                        'assets/img/labels/sadheart.png'))
              ],
            )));

    final needHelpOrNotWidget = Expanded(
        child: SizedBox(
            height: 200,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _giveIconIfTrue(widget.habit.needHelpOrNot,
                        'assets/img/labels/needhelp.png')),
                Expanded(
                    child: _giveIconIfFalse(widget.habit.needHelpOrNot,
                        'assets/img/labels/noneedhelp.png'))
              ],
            )));

    final satisfiedOrNotWidget = Expanded(
        child: SizedBox(
            height: 200,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _giveIconIfTrue(widget.habit.satisfiedOrNot,
                        'assets/img/labels/happyface.png')),
                Expanded(
                    child: _giveIconIfFalse(widget.habit.satisfiedOrNot,
                        'assets/img/labels/sadface.png'))
              ],
            )));

    final priorityWidget = Expanded(
        child: SizedBox(
            height: 200,
            child: Visibility(
              child: Placeholder(),
              visible: false,
            )));

    final item = Container(
      height: 200,
      child: Row(
        children: <Widget>[
          numeroWidget,
          nameWidget,
          likeOrNotWidget,
          needHelpOrNotWidget,
          satisfiedOrNotWidget,
          priorityWidget
        ],
      ),
    );

    return item;
  }
}
