import 'package:flutter/material.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/AccountStateViewModel.dart';

class AccountStatePage extends StatefulWidget {
  final AccountStateViewModel viewModel;

  AccountStatePage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _AccountStatePageState createState() => _AccountStatePageState();
}

class _AccountStatePageState extends State<AccountStatePage> {
  Map<String, dynamic> formData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> accountTypes = [
    'Accompagnateur',
    'Enfant',
    'Personne de contact'
  ];

  Widget listview = Text("Liste");
  String selectedAccountType;

  @override
  Widget build(BuildContext context) {
    // TODO
    return new MaterialApp(
      theme: ThemedApp.getThemeData(),
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Activer/Desactiver un compte'),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
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
            child: new Builder(
              builder: (context) => new Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Text("Type de compte:",
                            style: Theme.of(context).textTheme.title),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 55, //gives the height of the dropdown button
                          width: MediaQuery.of(context)
                              .size
                              .width, //gives the width of the dropdown button
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              color: Color(0xFFF2F2F2)),

                          child: Theme(
                              data: Theme.of(context).copyWith(
                                  canvasColor: Theme.of(context).accentColor,
                                  buttonTheme: ButtonTheme.of(context).copyWith(
                                    alignedDropdown:
                                        true, //If false (the default), then the dropdown's menu will be wider than its button.
                                  )),
                              child: DropdownButtonHideUnderline(
                                // to hide the default underline of the dropdown button
                                child: DropdownButton<String>(
                                    iconEnabledColor: Theme.of(context)
                                        .accentColor, // icon color of the dropdown button
                                    items: accountTypes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style:
                                              Theme.of(context).textTheme.body1,
                                        ),
                                      );
                                    }).toList(),
                                    // setting hint
                                    onChanged: (String value) {
                                      setState(() {
                                        selectedAccountType = value;
                                        // callback on the function

                                        widget.viewModel.displayList(
                                            context, selectedAccountType);
                                      });
                                    },
                                    value:
                                        selectedAccountType // displaying the selected value
                                    ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
