import 'package:flutter/material.dart';

import '../models/category.dart';
import './color_selector_display.dart';
import '../main.dart';

class AddCategoryDisplay extends StatefulWidget {
  final Function addCategory;

  AddCategoryDisplay(this.addCategory);

  @override
  _AddCategoryDisplayState createState() => _AddCategoryDisplayState();
}

class _AddCategoryDisplayState extends State<AddCategoryDisplay> {
  var categoryNameController = TextEditingController();
  var isAddingCategory;
  var inputError = false;
  final List<Map<String, Object>> possibleColors = [
    {
      'color': Colors.red,
      'selected': true,
    },
    {
      'color': Colors.blue,
      'selected': false,
    },
//    {
//      'color': Colors.yellow[800],
//      'selected': false,
//    },
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

  @override
  void initState() {
    isAddingCategory = false;
    super.initState();
  }

  void selectColor(index) {
    setState(() {
      var selectedColorIndex =
          possibleColors.indexWhere((color) => color['selected'] == true);
      if (selectedColorIndex >= 0) {
        possibleColors[selectedColorIndex]['selected'] = false;
      }
      possibleColors[index]['selected'] = true;
    });
  }

  void startCategoryDisplay(BuildContext ctx) {
    setState(() {
      isAddingCategory = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isAddingCategory ?() {
        startCategoryDisplay(context);
      } : null,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColorLight,
        ),
        child: isAddingCategory
            ? SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Category Name',
                        ),
                        controller: categoryNameController,
                      ),
                    ),
                    ColorSelectorDisplay(possibleColors, selectColor),
                    if (inputError)
                      Text(
                        'A Title is Required',
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.check, size: 30),
                            onPressed: () {
                              if (categoryNameController.text != '') {
                                widget.addCategory(
                                    categoryNameController.text,
                                    possibleColors.firstWhere((color) =>
                                        color['selected'] == true)['color'],
                                    isAddingCategory);
                                inputError = false;
                              } else {
                                setState(() {
                                  inputError = true;
                                });
                              }
                            }),
                        IconButton(
                          icon: Icon(Icons.exit_to_app),
                          onPressed: () {
                            setState(() {
                              isAddingCategory = false;
                              categoryNameController.text = '';
                              inputError = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Icon(
                Icons.add_to_photos,
                size: 100,
                color: Theme.of(context).primaryColorDark,
              ),
      ),
    );
  }
}
