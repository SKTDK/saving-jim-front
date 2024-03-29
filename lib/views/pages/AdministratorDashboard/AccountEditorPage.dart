import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';

class AccountEditorPage extends StatefulWidget {
  final AccountEditorViewModel viewModel;

  AccountEditorPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _AccountEditorPageState createState() => _AccountEditorPageState();
}

class _AccountEditorPageState extends State<AccountEditorPage> {
  Map<String, dynamic> formData;
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var passwordController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> accountTypes = [
    'Accompagnateur',
    'Enfant',
    'Personne de contact'
  ];

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget listview = Text("Liste");
  String selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Modifier un compte'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: ThemedApp.secondaryGradient,
            ),
          ),
          child: _content(),
        ),
      ),
    );
  }

  Widget _content() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return projectSnap.data;
        }

        if (projectSnap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return new Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text("Modifier un autre profil",
                        style: Theme.of(context).textTheme.title),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: Theme.of(context).primaryColorDark),
                      child: Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Theme.of(context).primaryColorDark,
                              buttonTheme: ButtonTheme.of(context).copyWith(
                                alignedDropdown: true,
                              )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                iconEnabledColor: Theme.of(context).accentColor,
                                items: accountTypes.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    selectedAccountType = value;
                                    widget.viewModel.fetchUsers(
                                        context, selectedAccountType);
                                  });
                                },
                                value: selectedAccountType),
                          )),
                    ),
                    Divider(color: Colors.black12, height: 5, thickness: 5.0),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Mon profil",
                        style: Theme.of(context).textTheme.title),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Prénom", style: Theme.of(context).textTheme.body1),
                    TextField(
                      style: new TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: firstnameController,
                      decoration: InputDecoration(
                        hintText: widget.viewModel.currentUser == null
                            ? "Prénom"
                            : widget.viewModel.currentUser.firstname,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Nom", style: Theme.of(context).textTheme.body1),
                    TextField(
                      style: new TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: lastnameController,
                      decoration: InputDecoration(
                        hintText: widget.viewModel.currentUser == null
                            ? "Nom"
                            : widget.viewModel.currentUser.lastname,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Mot de passe",
                        style: Theme.of(context).textTheme.body1),
                    TextField(
                      style: new TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              widget.viewModel
                                  .updateCurrentUser(
                                      firstnameController.text,
                                      lastnameController.text,
                                      passwordController.text)
                                  .then((result) {
                                if (result) {
                                  _displaySnackBar(context,
                                      'Modification réalisée avec succès');
                                } else {
                                  _displaySnackBar(
                                      context, 'Une erreur s\'est produite!');
                                }
                              });
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 100
                                  : 300,
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 41
                                  : 55,
                              decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: ThemedApp.buttonSwatch,
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "Modifier",
                                  textAlign: TextAlign.center,
                                  style: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? Theme.of(context).textTheme.display2
                                      : Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      future: widget.viewModel.fetchCurrentUser(),
    );
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
