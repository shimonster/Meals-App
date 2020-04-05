import 'package:flutter/material.dart';

import '../widgets/category_display.dart';
import '../models/category.dart';
import '../main.dart';
import '../widgets/add_category_display.dart';

class CategoriesScreen extends StatelessWidget {
  final Function addCategory;
  final List<Category> allCategories;

  CategoriesScreen(this.addCategory, this.allCategories);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          ...allCategories.map((catInfo) {
            return CategoryDisplay(catInfo.title, catInfo.color, catInfo.id);
          }).toList(),
          AddCategoryDisplay(addCategory),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}
