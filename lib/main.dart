import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/create_meal_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './models/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}
enum filterElement {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}


class _MyAppState extends State<MyApp> {
  List<Meal> filteredMeals;
  var allMeals = dummyRecipes;
  var allCategories = dummyCategories;

  Map<filterElement, bool> _filters = {
    filterElement.glutenFree: false,
    filterElement.vegan: false,
    filterElement.vegetarian: false,
    filterElement.lactoseFree: false
  };

  @override
  void initState() {
    filteredMeals = allMeals;
    super.initState();
  }

  List<Meal> favoriteMeals = [];

  void _addFilters (Map<filterElement, bool> currentFilters, BuildContext ctx) {
    setState(() {
      _filters = currentFilters;

      filteredMeals = allMeals.where((meal) {
        if (_filters[filterElement.glutenFree] && !meal.isGlutenFree) {
          return false;
        } else if (_filters[filterElement.vegan] && !meal.isVegan) {
          return false;
        } else if (_filters[filterElement.vegetarian] && !meal.isVegetarian) {
          return false;
        } else if (_filters[filterElement.lactoseFree] && !meal.isLactoseFree) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
    Navigator.of(ctx).pop();
    if (Navigator.of(ctx).canPop()) {
      Navigator.of(ctx).pop();
    }
  }

  void _switchFaveStatus (String id) {
    final mealIndexInFave = favoriteMeals.indexWhere((meal) {
      return meal.id == id;
    });
    if (mealIndexInFave >= 0) {
      setState(() {
        favoriteMeals.removeAt(mealIndexInFave);
      });
    } else {
      setState(() {
        favoriteMeals.add(allMeals.firstWhere((meal) {
          return meal.id == id;
        }));
      });
    }
  }

  bool _isMealFavorite (String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  void addCategory(String titleInput, Color selectedColor, bool isAddingCategory, ) {
    setState(() {
      isAddingCategory = false;
      allCategories.add(Category(
          id: '$titleInput${DateTime.now()}',
          title: titleInput,
          color: selectedColor));
    });
    print(allCategories);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.lightGreenAccent[100],
        canvasColor: Color.fromRGBO(195, 205, 210, 1),
        fontFamily: 'Raleway',
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 23,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
            ),
            subtitle: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
            body1: TextStyle(
              color: Color.fromRGBO(20, 60, 40, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 60, 40, 1),
            ),
            subhead: TextStyle(
              fontSize: 15,
            )
        ),
      ),
//      home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals, addCategory, allCategories),
        MealsScreen.screenRoute: (ctx) => MealsScreen(filteredMeals),
        MealDetailsScreen.screenRoute: (ctx) => MealDetailsScreen(_switchFaveStatus, _isMealFavorite, allMeals),
        FiltersScreen.screenRoute: (ctx) => FiltersScreen(_addFilters, _filters),
        CreateMealScreen.screenRoute: (ctx) => CreateMealScreen(allCategories),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen(favoriteMeals, addCategory, allCategories));
      },
    );
  }
}
