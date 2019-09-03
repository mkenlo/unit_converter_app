import "package:flutter/material.dart";
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';


double _rowHeight = 100.0;
double _rowPadding = 8.0;
double _iconPadding = 16.0;

double _iconSize = 60.0;
double _textSize = 24.0;
BorderRadius _borderRadius = BorderRadius.circular(30.0);
Icon _iconDefault =Icon(Icons.cake, size: _iconSize) ;


class Category extends StatelessWidget {
  String categoryName;
  Color categoryColor;
  Icon categoryIcon;

  Category({
    Key key,
    @required this.categoryName,
    @required this.categoryColor,
    @required this.categoryIcon,
  })  : assert(categoryName != null),
        assert(categoryColor != null),
        assert(categoryIcon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            height: _rowHeight,
            child: InkWell(
                borderRadius: _borderRadius,
                splashColor: Colors.blueGrey,
                highlightColor: categoryColor,
                onTap: () {
                  print("You just tap me");
                },
                child: Padding(
                    padding: EdgeInsets.all(_rowPadding),
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.all(_iconPadding),
                          child: _iconDefault),
                      Center(
                          child: Text(categoryName,
                              style: TextStyle(fontSize: _textSize)))
                    ])))));
  }
}
