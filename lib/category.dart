import "package:flutter/material.dart";
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'unit.dart';


const double _rowHeight = 100.0;
const double _rowPadding = 8.0;
const double _iconPadding = 16.0;
const double _iconSize = 60.0;
BorderRadius _borderRadius = BorderRadius.circular(30.0);
Icon _iconDefault = Icon(Icons.cake, size: _iconSize) ;


class Category extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  final Icon categoryIcon;
  final List<Unit> units;

  Category({
    Key key,
    @required this.categoryName,
    @required this.categoryColor,
    @required this.categoryIcon,
    @required this.units
  })  : assert(categoryName != null),
        assert(categoryColor != null),
        assert(categoryIcon != null),
        assert(units != null),
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
                              style: Theme.of(context).textTheme.headline,))
                    ])))));
  }
}
