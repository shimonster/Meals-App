import 'package:flutter/material.dart';

import '../models/category.dart';
import './color_selector_display.dart';
import '../main.dart';

class AddCategoryDisplay extends StatefulWidget {
  @override
  _AddCategoryDisplayState createState() => _AddCategoryDisplayState();
}

class _AddCategoryDisplayState extends State<AddCategoryDisplay> {
  var categoryNameController = TextEditingController();
  var isAddingCategory = false;
  final List<Map<String, Object>> possibleColors = [
    {
      'color': Colors.red,
      'selected': true,
    },
    {
      'color': Colors.blue,
      'selected': false,
    },
    {
      'color': Colors.yellow,
      'selected': false,
    },
    {
      'color': Colors.cyan,
      'selected': false,
    },
    {
      'color': Colors.green,
      'selected': false,
    },
    {
      'color': Colors.grey,
      'selected': false,
    },
    {
      'color': Colors.purple,
      'selected': false,
    },
    {
      'color': Colors.orange,
      'selected': false,
    },
    {
      'color': Colors.lightGreenAccent,
      'selected': false,
    },
    {
      'color': Colors.pink,
      'selected': false,
    },
    {
      'color': Colors.brown,
      'selected': false,
    },
  ];

  void selectColor(index) {
    var selectedColorIndex =
        possibleColors.indexWhere((color) => color['selected'] == true);
    if (selectedColorIndex >= 0) {
      possibleColors[selectedColorIndex]['selected'] = false;
    }
    possibleColors[index]['selected'] = true;
  }

  void startCategoryDisplay(BuildContext ctx) {
    setState(() {
      isAddingCategory = true;
    });
  }

  void addCategory(String titleInput, Color selectedColor) {
    setState(() {
      isAddingCategory = false;
      MyApp.allCategories.add(Category(
          id: '$titleInput${DateTime.now()}',
          title: titleInput,
          color: selectedColor));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        startCategoryDisplay(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        child: isAddingCategory
            ? Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Category Name',
                        border: OutlineInputBorder()),
                    controller: categoryNameController,
                  ),
                  ColorSelectorDisplay(possibleColors, selectColor),
                  FlatButton(
                    child: Text(
                      'Add',
                      style: Theme.of(context).textTheme.title,
                    ),
                    onPressed: () => addCategory(
                      categoryNameController.text,
                      possibleColors.firstWhere(
                          (color) => color['selected'] == true)['color'],
                    ),
                  ),
                ],
              )
            : Icon(
                Icons.add,
                size: 60,
              ),
      ),
    );
  }
}
