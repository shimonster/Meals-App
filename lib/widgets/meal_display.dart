import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDisplay extends StatelessWidget {
  final String id;
  final String name;
  final String imageURL;
  final TimeToMake timeToMake;
  final Servings servings;
  final List<Map<String, String>> ingredients;
  final List<String> preparationSteps;

  const MealDisplay({
    @required this.id,
    @required this.name,
    @required this.imageURL,
    @required this.servings,
    @required this.timeToMake,
    @required this.ingredients,
    @required this.preparationSteps,
  });

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: MediaQuery.of(context).size.height * 1 / 4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
