import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_add_customize_settings.dart';

import '../widgets/meal_add_ingredient_display.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_add_step_display.dart';
import '../widgets/button_selection_display.dart';

class CreateMealScreen extends StatefulWidget {
  static const screenRoute = '/create meal screen';
  final List<Category> categories;
  final Function addMeal;

  CreateMealScreen(this.categories, this.addMeal);

  @override
  _CreateMealScreenState createState() => _CreateMealScreenState();
}

class _CreateMealScreenState extends State<CreateMealScreen> {
  final _nameController = TextEditingController();
  Map<String, Servings> _selectedServing;
  Map<String, Complexity> _selectedComplexity;
  final _timeToMakeController = TextEditingController();
  final _imageURLController = TextEditingController();
  Map<String, List<String>> _selectedCategories;
  final List<String> _preparationSteps = [''];
  final List<Map<String, String>> _ingredients = [
    {'': '', '': ''}
  ];
  final _isGlutenFree = {'value': false};
  final _isLactoseFree = {'value': false};
  final _isVegan = {'value': false};
  final _isVegetarian = {'value': false};
  final _servingsOptions = [
    {
      'input': Text('A lot of people'),
      'output': Servings.Lots,
      'isSelected': false,
    },
    {
      'input': Text('A few people'),
      'output': Servings.Some,
      'isSelected': false,
    },
    {
      'input': Text('One person'),
      'output': Servings.One,
      'isSelected': false,
    }
  ];
  var _complexityOptions = [
    {
      'input': Text('Hard'),
      'output': Complexity.Hard,
      'isSelected': false,
    },
    {
      'input': Text('Medium'),
      'output': Complexity.Medium,
      'isSelected': false,
    },
    {
      'input': Text('Easy'),
      'output': Complexity.Easy,
      'isSelected': false,
    }
  ];

  List<Map<String, Object>> _categoryOptions = [];

  @override
  void initState() {
    _selectedServing = {'value': null};
    _selectedComplexity = {'value': null};
    _selectedCategories = {'value': []};
    _categoryOptions = widget.categories.map((category) {
      return {
        'input': Text(category.title),
        'output': category.title,
        'isSelected': false,
      };
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('create meal build() was run');
    void switchSelection(int thisIdx, bool canOnlySelectOne,
        Map<String, Object> wherePutOutput, List<Map<String, Object>> options) {
      setState(() {
        if (options[thisIdx]['isSelected'])
          options[thisIdx]['isSelected'] = false;
        else {
          if (canOnlySelectOne) {
            List<Map<String, Object>> otherOptions =
                options.where((option) => option != options[thisIdx]).toList();
            for (var i = 0; i < otherOptions.length; i++) {
              otherOptions[i]['isSelected'] = false;
            }
            options[thisIdx]['isSelected'] = true;
          } else {
            options[thisIdx]['isSelected'] = true;
          }
        }

        wherePutOutput['value'] = !canOnlySelectOne
            ? <String>[
                ...options.map((opt) {
                  if (opt['isSelected'])
                    return opt['output'];
                  else
                    return null;
                }).toList()
              ]
            : options[thisIdx]['output'];
      });
      print(_selectedServing == wherePutOutput);
      print(options[thisIdx]);
    }

    void _clearSelected(List<Map<String, Object>> options) {
      setState(() {
        for (var option in options) {
          option['isSelected'] = false;
        }
      });
    }

    void _manageSwitchSwitch(value, Map<String, bool> setting) {
      setState(() {
        setting['value'] = value;
        print('lactose free ${setting['value']}');
      });
    }

    Widget _buildButtonSelection(List<Map<String, Object>> options,
        bool canOnlySelectOne, Object whereOutput) {
      return ButtonSelectionDisplay(options, canOnlySelectOne, switchSelection,
          whereOutput, _clearSelected);
    }

    Widget _buildTextInput(String label, TextEditingController controller,
        TextInputType keyboard, IconData icon) {
      return Container(
        margin: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 10,
          top: 10,
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboard,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
          ),
        ),
      );
    }

    Widget _buildInputTitle(String title) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Meal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTextInput('Name', _nameController, TextInputType.text,
                Icons.local_dining),
            _buildTextInput('Time to make (minutes)', _timeToMakeController,
                TextInputType.number, Icons.attach_money),
            _buildTextInput('URL of image', _imageURLController,
                TextInputType.url, Icons.insert_photo),
            _buildInputTitle('How many people does this recipe sereve'),
            _buildButtonSelection(
              _servingsOptions,
              true,
              _selectedServing,
            ),
            _buildInputTitle('How hard is this recipe to make'),
            _buildButtonSelection(
              _complexityOptions,
              true,
              _selectedComplexity,
            ),
            _buildInputTitle('Which Categories Does This Meal Fall Into'),
            _buildButtonSelection(
              _categoryOptions,
              false,
              _selectedCategories,
            ),
            _buildInputTitle('Which Ingredients Go Into This Meal'),
            MealAddIngredientDisplay(_ingredients),
            _buildInputTitle('Which Are The Steps To Make This Meal'),
            MealAddStepDisplay(_preparationSteps),
            _buildInputTitle('Which (If Any) Apply To This Meal'),
            MealAddCustomizeSettings(
                _isGlutenFree,
                _isLactoseFree,
                _isVegan,
                _isVegetarian,
                _manageSwitchSwitch),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  widget.addMeal(
                    _nameController,
                    _selectedServing['value'],
                    _selectedComplexity['value'],
                    _timeToMakeController,
                    _imageURLController,
                    _selectedCategories['value'],
                    _preparationSteps,
                    _ingredients,
                    _isGlutenFree['value'],
                    _isLactoseFree['value'],
                    _isVegan['value'],
                    _isVegetarian['value'],
                  );
                  Navigator.of(context).pushReplacementNamed('/');
                  print([_isGlutenFree, _isLactoseFree, _isVegan, _isVegetarian]);
                }),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
