import 'package:flutter/material.dart';

import './category_meals_screen.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.limeAccent,
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
          textTheme: ThemeData.light().textTheme.copyWith(
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
              ),
        ),
//      home: CategoriesScreen(),
        routes: {
          '/': (ctx) => CategoriesScreen(),
          CategoryMealsScreen.screenRoute: (ctx) => CategoryMealsScreen()
        });
  }
}
