import 'package:flutter/material.dart';

import '../widgets/category_display.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App',),
      ),
      body: Container(
        child: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((Category catInfo) {
            return CategoryDisplay(catInfo.title, catInfo.color, catInfo.id);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4/3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
        ),
      ),
    );
  }
}