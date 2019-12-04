import 'package:flutter/material.dart';

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajouter un nouveau client',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ajouter un nouveau client'),
        ),
        body: Center(
          child: Text('Ajouter un nouveau client'),
        ),
      ),
    );
  }
}
