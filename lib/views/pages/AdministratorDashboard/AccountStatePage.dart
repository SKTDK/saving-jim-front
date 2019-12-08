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
          child: new Builder(
            builder: (context) => new Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 55, //gives the height of the dropdown button
                        width: MediaQuery.of(context)
                            .size
                            .width, //gives the width of the dropdown button
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
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
                                  iconEnabledColor: Color(
                                      0xFF595959), // icon color of the dropdown button
                                  items: accountTypes.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 15),
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
    );
  }
}
