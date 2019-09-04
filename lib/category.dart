import "package:flutter/material.dart";

// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'unit.dart';
import 'converter_route.dart';

const double _rowHeight = 100.0;
const double _rowPadding = 8.0;
const double _iconPadding = 16.0;
const double _iconSize = 60.0;
BorderRadius _borderRadius = BorderRadius.circular(30.0);
Icon _iconDefault = Icon(Icons.cake, size: _iconSize);

class Category extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  final Icon categoryIcon;
  final List<Unit> units;

  Category(
      {Key key,
      @required this.categoryName,
      @required this.categoryColor,
      @required this.categoryIcon,
      @required this.units})
      : assert(categoryName != null),
        assert(categoryColor != null),
        assert(categoryIcon != null),
        assert(units != null),
        super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    // DONE: Using the Navigator, navigate to the [ConverterRoute]

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                elevation: 1.0,
                title: Text(categoryName),
                backgroundColor: categoryColor),
            body: ConverterRoute(units: units, color: categoryColor),
            resizeToAvoidBottomPadding: false);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.transparent,
            height: _rowHeight,
            child: InkWell(
                borderRadius: _borderRadius,
                splashColor: Colors.blueGrey,
                highlightColor: categoryColor,
                // We can use either the () => function() or the () { function(); }
                // syntax.
                // DONE: Update this onTap property to call _navigateToConverter()
                onTap: () {
                  //print("You just tap me");
                  _navigateToConverter(context);
                },
                child: Padding(
                    padding: EdgeInsets.all(_rowPadding),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(_iconPadding),
                              child: _iconDefault),
                          Center(
                              child: Text(
                            categoryName,
                            style: Theme.of(context).textTheme.headline,
                          ))
                        ])))));
  }
}
