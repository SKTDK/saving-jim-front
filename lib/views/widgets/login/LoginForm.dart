import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:saving_jim/view_models/LoginPageViewModel.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var displayMode =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return ScopedModelDescendant<LoginPageViewModel>(
        builder: (context, child, model) {
      return new Container(
        width: 800,
        height: displayMode ? 450 : 500,
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
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Connexion à Esope",
                    style: Theme.of(context).textTheme.subhead),
                SizedBox(
                  height: 30,
                ),
                Text("Nom d'utilisateur",
                    style: Theme.of(context).textTheme.body2),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Nom d'utilisateur",
                      hintStyle: Theme.of(context).textTheme.caption),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Mot de passe", style: Theme.of(context).textTheme.body2),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: Theme.of(context).textTheme.caption),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        _login(context, model).then((result) {
                          if (!result) {
                            _displaySnackBar(context);
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
                          "Connexion",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<bool> _login(BuildContext context, LoginPageViewModel model) {
    return model.setUser(
        context, usernameController.text, passwordController.text);
  }

  _displaySnackBar(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Invalid username/password'),
      ),
    );
  }
}
