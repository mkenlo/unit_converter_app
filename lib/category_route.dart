// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'category.dart';

// Define any constants
const Icon _iconDefault = Icon(Icons.cake);

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

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

  @override
  Widget build(BuildContext context) {
    // Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    List<Category> categoryList = new List();
    for (int i = 0; i < _categoryNames.length; i++) {
      categoryList.add(Category(
          categoryName: _categoryNames[i],
          categoryColor: _baseColors[i],
          categoryIcon: _iconDefault));
    }

    // Create a list view of the Categories
    final listView = Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildCategoryListWidget(categoryList)),
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
