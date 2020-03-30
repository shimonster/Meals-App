import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealDisplay extends StatelessWidget {
  final Color color;
  final String id;
  final String name;
  final String imageURL;
  final int timeToMake;
  final Servings servings;
  final Complexity complexity;
  final List<Map<String, String>> ingredients;
  final List<String> preparationSteps;

  const MealDisplay({
    @required this.color,
    @required this.id,
    @required this.name,
    @required this.imageURL,
    @required this.servings,
    @required this.timeToMake,
    @required this.complexity,
    @required this.ingredients,
    @required this.preparationSteps,
  });

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.screenRoute,
      arguments: {'id': id, 'color': color},
    ).then((id) {
      if (id != null) {
//        removeMeal(id);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Easy';
        break;
      case Complexity.Medium:
        return 'Medium';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get servingsText {
    switch (servings) {
      case Servings.One:
        return 'Serves One';
        break;
      case Servings.Some:
        return 'Serves a Few';
        break;
      case Servings.Lots:
        return 'Serves Many';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectMeal(context);
      },
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
                ),
                Positioned(
                  bottom: 15,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 8 / 12,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.group),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        servingsText,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$timeToMake mins',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fitness_center),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        complexityText,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
