import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const screenRoute = '/MealDetailsScreen';

  @override
  Widget build(BuildContext context) {
    var routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    var thisMeal = DUMMY_RECIPES.where(
      (meal) {
        return meal.id == routeArgs['id'];
      },
    ).toList()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          thisMeal.name
        ),
        backgroundColor: routeArgs['color'],
      ),
    );
  }
}
