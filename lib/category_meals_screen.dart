import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
//  final String categoryID;
//  final String categoryTitle;
//  final Color categoryColor;
//
//  CategoryMealsScreen(this.categoryTitle, this.categoryID, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
        backgroundColor: routeArgs['color'],
      ),
      body: Center(
        child: Text(routeArgs['id']),
      ),
    );
  }
}
