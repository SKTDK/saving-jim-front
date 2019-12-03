import 'package:flutter/material.dart';
import 'package:pfefront/model/Category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) { 

    final categoryThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 16.0
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage(category.image),
      height: 92.0,
      width: 92.0,
    ),
  );

  final categoryCardCotent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 36.0
          )
      )
    );

  final planetCard = new Container(
    child:categoryCardCotent,
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(  
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

    return new Container(
       margin: const EdgeInsets.symmetric(
         vertical: 16.0,
         horizontal: 24.0,
       ),
       child: new Stack(
        children: <Widget>[
          planetCard,
          categoryThumbnail,
        ],
      )
    );
    }

}