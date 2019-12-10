import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/widgets/HabitItem.dart';

class HabitsListPage extends StatefulWidget {
  final GameViewModel viewModel;
  HabitsListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  HabitsList createState() => HabitsList();
}

class HabitsList extends State<HabitsListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: new GridView.builder(
            itemCount: widget.viewModel.fetchHabits(context).length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return new HabitItem(
                  habit: widget.viewModel.fetchHabits(context)[index]);
            },
          ),
        ),
        appBar: AppBar(
          title: Text(widget.viewModel.user != null
              ? "Sélection des habitudes: " + widget.viewModel.user.firstname
              : "Sélection des habitudes"),
        ),
      ),
    );
  }
}
