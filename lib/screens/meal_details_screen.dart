import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';


class MealDetailsScreen extends StatelessWidget {
  static const screenRoute = '/MealDetailsScreen';


  @override
  Widget build(BuildContext context) {
    var routeArgs = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('asdf'),
    ),);
  }
}
