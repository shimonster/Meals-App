import 'package:flutter/foundation.dart';

enum TimeToMake {
  Quick,
  Some,
  Long,
}

enum Servings {
  Lots,
  Some,
  One,
}

class Meal {
  final String id;
  final String name;
  final String imageURL;
  final TimeToMake timeToMake;
  final Servings servings;
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
    @required this.ingredients,
    @required this.preparationSteps,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
