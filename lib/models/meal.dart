import 'package:flutter/foundation.dart';


enum Servings {
  Lots,
  Some,
  One,
}

enum Complexity {
  Hard,
  Medium,
  Easy,
}

class Meal {
  final String id;
  final String name;
  final String imageURL;
  final int timeToMake;
  final Servings servings;
  final Complexity complexity;
  final List<String> categories;
  final List<Map<String, String>> ingredients;
  final List<String> preparationSteps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.name,
    @required this.imageURL,
    @required this.servings,
    @required this.timeToMake,
    @required this.categories,
    @required this.complexity,
    @required this.ingredients,
    @required this.preparationSteps,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
