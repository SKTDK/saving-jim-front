import 'package:flutter/material.dart';
import 'package:saving_jim/view_models/Game/GameViewModel.dart';
import 'package:saving_jim/views/widgets/CategoryListItem.dart';

class CategoriesListPage extends StatefulWidget {
  final GameViewModel viewModel;
  CategoriesListPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  CategoriesList createState() => CategoriesList();
}

class CategoriesList extends State<CategoriesListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildMenu(),
        appBar: AppBar(
          title: Text(widget.viewModel.user != null
              ? "Choisir une categorie: " + widget.viewModel.user.firstname
              : "Choisir une categorie"),
        ),
      ),
    );
  }

// First we build the Menu Wrapped in a ListView Widget
// Here we set the styling of our Menu rows/entries
  Widget _buildMenu() {
    widget.viewModel.fetchCategories();
    return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: Colors.black45, thickness: 2.0, height: 0),
        itemBuilder: (BuildContext context, int index) => CategoryListItem(
            index, widget.viewModel.categories[index], widget.viewModel),
        itemCount: widget.viewModel.categories == null
            ? 0
            : widget.viewModel.categories.length);
  }
}
