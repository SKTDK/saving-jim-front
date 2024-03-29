import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountEditorViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAccountEditorPage extends StatefulWidget {
  final AccountEditorViewModel viewModel;

  UserAccountEditorPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _UserAccountEditorPageState createState() => _UserAccountEditorPageState();
}

class _UserAccountEditorPageState extends State<UserAccountEditorPage>
    with SingleTickerProviderStateMixin {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 1000, height: 1334, allowFontScaling: true);
    return new Scaffold(
      appBar: AppBar(
        title: Text('Modifier un compte: ' +
            (widget.viewModel.selectedUser == null
                ? ""
                : widget.viewModel.selectedUser.username)),
      ),
      key: _scaffoldKey,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text("Prénom", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: firstnameController,
                  decoration: InputDecoration(
                    hintText: widget.viewModel.selectedUser == null
                        ? "Prénom"
                        : widget.viewModel.selectedUser.firstname,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Nom", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: lastnameController,
                  decoration: InputDecoration(
                    hintText: widget.viewModel.selectedUser == null
                        ? "Nom"
                        : widget.viewModel.selectedUser.lastname,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Mot de passe", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Mot de passe",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          widget.viewModel
                              .updateSelectedUser(
                                  firstnameController.text,
                                  lastnameController.text,
                                  passwordController.text)
                              .then((result) {
                            if (result) {
                              _displaySnackBar(
                                  context, 'Modification réalisée avec succès');
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
      ),
    );
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
