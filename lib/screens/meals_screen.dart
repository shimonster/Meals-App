import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_display.dart';
import './create_meal_screen.dart';

class MealsScreen extends StatefulWidget {
  static const screenRoute = '/Catigory Meals Screen';
  final List<Meal> filteredMeals;

  MealsScreen(this.filteredMeals) {
    print('MealScreen widget was built');
  }

  @override
  _MealsScreenState createState() {
    return _MealsScreenState();
  }
}

class _MealsScreenState extends State<MealsScreen> {
  Map<String, Object> routeArgs;
  List<Meal> categoryMeals;
  var _didInitState = false;

  @override
  void didChangeDependencies() {
    if (!_didInitState) {
      routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryMeals = widget.filteredMeals.where((item) {
        return item.categories.contains(routeArgs['category title']);
      }).toList();
      _didInitState = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('mealScreen build() was run');
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['category title']),
        backgroundColor: routeArgs['color'],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealDisplay(
            color: routeArgs['color'],
            id: categoryMeals[index].id,
            name: categoryMeals[index].name,
            imageURL: categoryMeals[index].imageURL,
            timeToMake: categoryMeals[index].timeToMake,
            complexity: categoryMeals[index].complexity,
            ingredients: categoryMeals[index].ingredients,
            preparationSteps: categoryMeals[index].preparationSteps,
            servings: categoryMeals[index].servings,
          );
        },
        itemCount: categoryMeals.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(CreateMealScreen.screenRoute);
        },
      ),
    );
  }
}
