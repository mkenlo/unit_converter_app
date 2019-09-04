// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

// Define any constants
const Icon _iconDefault = Icon(Icons.cake);

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
///
// DONE: Make CategoryRoute a StatefulWidget
class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  // DONE: Create State object for the CategoryRoute
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  List<Category> categories = new List();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryListWidget(List categories) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return categories[index];
        });
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  void initState() {
    for (int i = 0; i < _categoryNames.length; i++) {
      categories.add(
        Category(
            categoryName: _categoryNames[i],
            categoryColor: _baseColors[i],
            categoryIcon: _iconDefault,
            units: _retrieveUnitList(_categoryNames[i])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Create a list view of the Categories
    final listView = Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildCategoryListWidget(categories)),
    );

    // Create an App Bar
    final appBar = AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Unit Converter",
          style: TextStyle(fontSize: 30.0, color: Colors.black),
        ));

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
