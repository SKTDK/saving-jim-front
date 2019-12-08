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
    return new MaterialApp(
      theme: ThemedApp.getThemeData(),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Creation compte accompagnateur'),
        ),
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
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
                  Text("Prenom", style: Theme.of(context).textTheme.body1),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: firstnameController,
                    decoration: InputDecoration(
                        hintText: "John",
                        hintStyle: Theme.of(context).textTheme.caption),
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
                        hintStyle: Theme.of(context).textTheme.caption),
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
                        hintStyle: Theme.of(context).textTheme.caption),
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
                        hintStyle: Theme.of(context).textTheme.caption),
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
                            // callback on the function
                            _addManager(context, widget.viewModel).then((res) {
                              if (res) {
                                _displaySnackBar(
                                    context, 'Accompagnateur ajoute');
                              } else {
                                _displaySnackBar(
                                    context, 'Une erreur est survenue');
                              }
                            });
                          },
                          child: Text('Creation',
                              style: Theme.of(context).textTheme.body1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
