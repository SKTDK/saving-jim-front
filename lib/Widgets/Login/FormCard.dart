import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// To use the log() method
//import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../ManagerDashboard/ManagerDashboard.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
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
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(displayMode ? 400 : 500),
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
              Text("Connexion à Esope BD",
                  style: Theme.of(context).textTheme.title),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text("Nom d'utilisateur",
                  style: Theme.of(context).textTheme.body1),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Nom d'utilisateur",
                    hintStyle: Theme.of(context).textTheme.caption),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text("Mot de passe", style: Theme.of(context).textTheme.body1),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Mot de passe",
                    hintStyle: Theme.of(context).textTheme.caption),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _login(usernameController.text, passwordController.text);
                    },
                    child: Text('Connexion',
                        style: Theme.of(context).textTheme.body1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login(String username, String password) async {
    Map map = {'username': username, 'password': password};
    String remote = "";

    if (Platform.isAndroid) {
      remote = 'http://10.0.2.2';
    } else {
      remote = 'http://localhost';
    }
    String url = remote + ':' + '8080' + "/login";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));
    //log(json.encode(map).toString());

    HttpClientResponse response = await request.close();

    // TODO: check response.statusCode
    String reply = await response.transform(utf8.decoder).join();

    httpClient.close();
    final body = json.decode(reply);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (body['success']) {
      final String token = body['token'];
      await sharedPreferences.setString('token', token);
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ManagerDashboard(),
          ),
          (r) => false);
    } else {
      await sharedPreferences.setString('token', null);
    }
  }
}
