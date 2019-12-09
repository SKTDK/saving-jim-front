import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saving_jim/view_models/ManagerDashboard/AddChildViewModel.dart';

class AddChildPage extends StatefulWidget {
  final AddChildViewModel viewModel;

  AddChildPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _AddChildPageState createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage>
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
    return new MaterialApp(
      theme: ThemedApp.getThemeData(),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Création compte enfant'),
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
                  colors: [
                    Colors.blueGrey[800],
                    Colors.blueGrey[700],
                    Colors.blueGrey[600],
                    Colors.blueGrey[400],
                  ],
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
                  Text("Prénom", style: Theme.of(context).textTheme.body1),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: firstnameController,
                    decoration: InputDecoration(
                      hintText: "John",
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
                    textAlign: TextAlign.center,
                    controller: lastnameController,
                    decoration: InputDecoration(
                      hintText: "Doe",
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
                  Text("Nom d'utilisateur",
                      style: Theme.of(context).textTheme.body1),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "johndoe",
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
                  Text("Mot de passe",
                      style: Theme.of(context).textTheme.body1),
                  TextField(
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
                            _addUser(context, widget.viewModel).then((res) {
                              if (res) {
                                _displaySnackBar(context, 'Enfant ajouté');
                              } else {
                                _displaySnackBar(
                                    context, 'Une erreur est survenue');
                              }
                            });
                          },
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: 300,
                            decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                              colors: [
                                Color.fromARGB(255, 148, 231, 225),
                                Color.fromARGB(255, 62, 182, 226)
                              ],
                            )),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Sauvegarder",
                              textAlign: TextAlign.center,
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
      ),
    );
  }

  Future<bool> _addUser(BuildContext context, AddChildViewModel model) async {
    return model.addUser(
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
