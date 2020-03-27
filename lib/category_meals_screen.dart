import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const screenRoute = '/Catigory Meals Screen';

//  final String categoryID;
//  final String categoryTitle;
//  final Color categoryColor;
//
//  CategoryMealsScreen(this.categoryTitle, this.categoryID, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryMeals = DUMMY_RECIPES.where((item) {
      return item.categories.contains(routeArgs['title']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
        backgroundColor: routeArgs['color'],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].name);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
