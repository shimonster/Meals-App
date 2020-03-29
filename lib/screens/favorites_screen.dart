import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_display.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function removeFavorite;

  FavoritesScreen(this.favoriteMeals, this.removeFavorite);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? Column(
              children: <Widget>[
                Image.network(
                  'https://stat.ameba.jp/user_images/20190121/17/returnofhappiness1024/bf/d8/g/o0500050014342809733.gif',
                  height: MediaQuery.of(context).size.height * 1 / 2,
                ),
                Text(
                  'You have no favorites yet',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )
          : SingleChildScrollView(
        child: Column(
          children: favoriteMeals.map((meal) {
            return MealDisplay(
              color: Theme.of(context).primaryColor,
              complexity: meal.complexity,
              servings: meal.servings,
              preparationSteps: meal.preparationSteps,
              ingredients: meal.ingredients,
              name: meal.name,
              id: meal.id,
              imageURL: meal.imageURL,
              timeToMake: meal.timeToMake,
              removeMeal: removeFavorite,
            );
          }).toList(),
        ),
      ),
    );
  }
}
