import 'package:flutter/material.dart';

import '../screens/meals_screen.dart';

class CategoryDisplay extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryDisplay(this.title, this.color, this.id) {
    print('category_display widget was built');
  }

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealsScreen.screenRoute,
      arguments: {'id': id, 'category title': title, 'color': color},
    );
  }

  @override
  Widget build(BuildContext context) {
    print('categoryDisplay build() was run');
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
