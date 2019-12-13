import 'package:flutter/material.dart';
import 'package:saving_jim/models/User.dart';
import 'package:saving_jim/utils/ThemedApp.dart';
import 'package:saving_jim/view_models/PersonOfContact/PersonOfContactListViewModel.dart';

// This is the design of a single user item within the accountstate page
class ContactChildListItem extends StatelessWidget {
  const ContactChildListItem(this.index, this.user, this.vm);
  final int index;
  final User user;
  final ContactChildListViewModel vm;

  Widget _buildTiles(User root, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: index % 2 == 0
              ? ThemedApp.primaryGradient
              : ThemedApp.secondaryGradient,
        ),
      ),
      child: ListTile(
        onTap: () {},
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(root.firstname,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title),
              ),
              Center(
                child: Text(root.lastname,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(user, context);
  }
}
