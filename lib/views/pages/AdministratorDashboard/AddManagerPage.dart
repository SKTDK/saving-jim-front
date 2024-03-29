import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AddManagerViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddManagerPage extends StatefulWidget {
  final AddManagerViewModel viewModel;

  AddManagerPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _AddManagerPageState createState() => _AddManagerPageState();
}

class _AddManagerPageState extends State<AddManagerPage>
    with SingleTickerProviderStateMixin {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 1000, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Création compte accompagnateur'),
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
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 15.0),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, -10.0),
                    blurRadius: 10.0),
              ]),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(60),
                ),
                Text("Prénom:", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: firstnameController,
                  decoration: InputDecoration(
                    hintText: "...",
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
                Text("Nom:", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: lastnameController,
                  decoration: InputDecoration(
                    hintText: "...",
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
                Text("Nom d'utilisateur:",
                    style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "...",
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
                Text("Mot de passe:", style: Theme.of(context).textTheme.body1),
                TextField(
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "...",
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
                          _addManager(context, widget.viewModel).then((res) {
                            if (res) {
                              _displaySnackBar(
                                  context, 'Accompagnateur ajouté');
                            } else {
                              _displaySnackBar(
                                  context, 'Une erreur est survenue');
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
                              "Sauvegarder",
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
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _addManager(
      BuildContext context, AddManagerViewModel model) async {
    return model.addManager(
        context,
        firstnameController.text,
        lastnameController.text,
        usernameController.text,
        passwordController.text);
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
