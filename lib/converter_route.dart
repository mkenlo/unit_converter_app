// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
// DONE: Make ConverterRoute a StatefulWidget
class ConverterRoute extends StatefulWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final Color color;

  // DONE: Create State object for the ConverterRoute
  @override
  _ConverterRouteState createState() => _ConverterRouteState();

  /// This [ConverterRoute] requires the color and units to not be null.
  // DONE: Pass in the [Category]'s color
  const ConverterRoute({@required this.units, @required this.color})
      : assert(units != null),
        assert(color != null),
        super();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  Widget build(BuildContext context) {
    final unitWidgets = widget.units.map((Unit unit) {
      // DONE: Set the color for this Container
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
