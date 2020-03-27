import 'package:flutter/material.dart';

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
        canvasColor: Color.fromRGBO(180, 225, 180, 1),
        fontFamily: 'Raleway',
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
      home: CategoriesScreen(),
    );
  }
}