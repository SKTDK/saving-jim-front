import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
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
                decoration: InputDecoration(
                    hintText: "Nom d'utilisateur",
                    hintStyle: Theme.of(context).textTheme.caption),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text("Mot de passe", style: Theme.of(context).textTheme.body1),
              TextField(
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
                    onPressed: () {},
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
}
