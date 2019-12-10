import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/ManagerDashboard/EditChildViewModel.dart';
import 'package:saving_jim/views/widgets/EditChildListItem.dart';

class EditChildListPage extends StatefulWidget {
  final EditChildViewModel viewModel;

  EditChildListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  EditChild createState() => EditChild();
}

class EditChild extends State<EditChildListPage> {
  var usernameController = TextEditingController();

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
        return new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black,
                    Colors.black87,
                    Colors.black54,
                    Colors.black45,
                  ],
                ),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.center,
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Nom d'utlisateur",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: RaisedButton(
                      onPressed: () {
                        //widget.viewModel.search();
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 200,
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                          colors: [
                            Color.fromARGB(255, 148, 231, 225),
                            Color.fromARGB(255, 62, 182, 226)
                          ],
                        )),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Rechercher",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.black45, thickness: 2.0, height: 0),
                  itemBuilder: (BuildContext context, int index) => Center(
                        child: EditChildListItem(
                            index, projectSnap.data[index], widget.viewModel),
                      ),
                  itemCount:
                      projectSnap.data == null ? 0 : projectSnap.data.length),
            ),
          ],
        );
      },
      future: widget.viewModel.fetchChildren(),
    );
  }
}
