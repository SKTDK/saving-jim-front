import 'package:flutter/material.dart';
import 'package:saving_jim/views/widgets/AccounStateListItem.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';

class AccountStateListPage extends StatefulWidget {
  final AccountStateViewModel viewModel;
  AccountStateListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<AccountStateListPage> {
  var searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildMenu(),
        appBar: AppBar(
          title: Text('Tableau de bord - Administrateur'),
        ),
      ),
    );
  }

// First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  // Widget _buildMenu() {
  //   return ListView.separated(
  //       separatorBuilder: (context, index) =>
  //           Divider(color: Colors.black45, thickness: 2.0, height: 0),
  //       itemBuilder: (BuildContext context, int index) => Center(
  //             child: AccountStateListItem(
  //                 widget.viewModel.users[index], widget.viewModel),
  //           ),
  //       itemCount:
  //           widget.viewModel.users == null ? 0 : widget.viewModel.users.length);
  // }

  // First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  Widget _buildMenu() {
    return Builder(
      builder: (context) => new Column(
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
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Recherche",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: RaisedButton(
                    onPressed: () {
                      widget.viewModel
                          .search(context, searchController.text)
                          .then((result) {
                        if (result != null) {
                          widget.viewModel.redirect(context, result);
                          setState(() {});
                        } else {
                          _displaySnackBar(context, 'Aucun résultat trouvé');
                        }
                      });
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
                      child: AccountStateListItem(
                          user: widget.viewModel.users[index],
                          viewModel: widget.viewModel),
                    ),
                itemCount: widget.viewModel.users == null
                    ? 0
                    : widget.viewModel.users.length),
          ),
        ],
      ),
    );
  }

  _displaySnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Aucun résultat trouvé'),
      ),
    );
  }
}
