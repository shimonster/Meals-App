import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_display.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

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
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealDisplay(
                  color: Theme.of(context).primaryColor,
                  id: favoriteMeals[index].id,
                  name: favoriteMeals[index].name,
                  imageURL: favoriteMeals[index].imageURL,
                  timeToMake: favoriteMeals[index].timeToMake,
                  complexity: favoriteMeals[index].complexity,
                  ingredients: favoriteMeals[index].ingredients,
                  preparationSteps: favoriteMeals[index].preparationSteps,
                  servings: favoriteMeals[index].servings,
                );
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
