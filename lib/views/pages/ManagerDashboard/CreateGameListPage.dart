import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/ManagerDashboard/CreateGameViewModel.dart';
import 'package:saving_jim/views/widgets/ChildListItem.dart';

class CreateGameListPage extends StatefulWidget {
  final CreateGameViewModel viewModel;
  CreateGameListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  CreateGame createState() => CreateGame();
}

class CreateGame extends State<CreateGameListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildMenu(),
        appBar: AppBar(
          title: Text('Liste des enfants'),
        ),
      ),
    );
  }

// First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  Widget _buildMenu() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return projectSnap.data;
        }
        return ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(color: Colors.black45, thickness: 2.0, height: 0),
            itemBuilder: (BuildContext context, int index) => Center(
                  child: ChildListItem(
                      index, projectSnap.data[index], widget.viewModel),
                ),
            itemCount: projectSnap.data == null ? 0 : projectSnap.data.length);
      },
      future: widget.viewModel.fetchChildren(),
    );
  }
}
