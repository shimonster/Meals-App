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
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    Servings _selectedServings;
    Complexity _selectedComplexity;
    final _timeToMakeController = TextEditingController();
    final _imageURLController = TextEditingController();
    final List<String> _selectedCategories = [];
    final List<String> _preparationSteps = [''];
    final List<Map<String, String>> _ingredients = [
      {'': '', '': ''}
    ];
    final bool isGlutenFree = false;
    final bool isLactoseFree = false;
    final bool isVegan = false;
    final bool isVegetarian = false;

    void switchSelection(
        int thisIdx,
        Map<String, Object> thisOption,
        bool canOnlySelectOne,
        objectBasedOn,
        List options) {
      setState(() {
        if (canOnlySelectOne) {
          thisOption['isSelected'] = true;
          options.map((option) {
            if (option != thisOption) option['isSelected'] = false;
          });
        } else {
          thisOption['isSelected'] = true;
        }
        objectBasedOn = !canOnlySelectOne ? options.map((opt) {
          if (opt['isSelected'])
            return opt['output'];
          else
            return;
        }).toList() : options.firstWhere((opt) => opt['isSelected']);
      });
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
            ButtonSelectionDisplay(
              [
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
              ],
              true,
              switchSelection,
              _selectedServings,
            ),
            _buildInputTitle('How hard is this recipe to make'),
            ButtonSelectionDisplay(
              [
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
              ],
              true,
              switchSelection,
              _selectedComplexity,
            ),
//            SizedBox(
//              height: 20,
//            ),
            _buildInputTitle('Which Categories Does This Meal Fall Into'),
            ButtonSelectionDisplay(
              widget.categories.map((category) {
                return {
                  'input': Text(category.title),
                  'output': category.title,
                  'isSelected': false,
                };
              }).toList(),
              false,
              switchSelection,
              _selectedCategories
            ),
            _buildInputTitle('Which Ingredients Go Into This Meal'),
            MealAddIngredientDisplay(_ingredients),
            _buildInputTitle('Which Are The Steps To Make This Meal'),
            MealAddStepDisplay(_preparationSteps),
            _buildInputTitle('Which (If Any) Apply To This Meal'),
            MealAddCustomizeSettings(
                isGlutenFree, isLactoseFree, isVegan, isVegetarian),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                widget.addMeal(
                  _nameController,
                  _selectedServings,
                  _selectedComplexity,
                  _timeToMakeController,
                  _imageURLController,
                  _selectedCategories,
                  _preparationSteps,
                  _ingredients,
                  isGlutenFree,
                  isLactoseFree,
                  isVegan,
                  isVegetarian,
                );
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
