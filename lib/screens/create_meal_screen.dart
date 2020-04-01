import 'package:flutter/material.dart';

import '../widgets/meal_add_ingredient_display.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_add_step_display.dart';
import '../widgets/button_selection_display.dart';


class CreateMealScreen extends StatelessWidget {
  static const screenRoute = '/create meal screen';
  final List<Category> categories;

  CreateMealScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    String selectedServings;
    String selectedComplexity;
    final _timeToMakeController = TextEditingController();
    final _imageURLController = TextEditingController();
    final List<String> _selectedCategories = [];
    final List<String> _preparationSteps = [''];
    final List<Map<String, String>> _ingredients = [
      {
        'amount': '3 cups',
        'ingredient': 'flour',
      }
    ];

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
                },
                {
                  'input': Text('A few people'),
                  'output': Servings.Some,
                },
                {
                  'input': Text('One person'),
                  'output': Servings.One,
                }
              ],
              (output) {
                switch (output) {
                  case Servings.Lots:
                    return selectedServings = 'Serves Many';
                    break;
                  case Servings.Some:
                    return selectedServings = 'Serves a Few';
                    break;
                  case Servings.One:
                    return selectedServings = 'Serves One';
                    break;
                  default:
                    return selectedServings = 'Unknow';
                }
              },
              true,
            ),
            _buildInputTitle('How hard is this recipe to make'),
            ButtonSelectionDisplay(
              [
                {
                  'input': Text('Hard'),
                  'output': Complexity.Hard,
                },
                {
                  'input': Text('Medium'),
                  'output': Complexity.Medium,
                },
                {
                  'input': Text('Easy'),
                  'output': Complexity.Easy,
                }
              ],
              (output) {
                switch (output) {
                  case Complexity.Hard:
                    return selectedComplexity = 'Hard';
                    break;
                  case Complexity.Medium:
                    return selectedComplexity = 'Medium';
                    break;
                  case Complexity.Easy:
                    return selectedComplexity = 'Easy';
                    break;
                  default:
                    return selectedComplexity = 'Unknow';
                }
              },
              true,
            ),
//            SizedBox(
//              height: 20,
//            ),
            _buildInputTitle('Which Categories Does This Meal Fall Into'),
            ButtonSelectionDisplay(
              categories.map((category) {
                return {
                  'input': Text(category.title),
                  'output': category.title,
                };
              }).toList(),
              (output) {
                _selectedCategories.add('c');
              },
              false,
            ),
            MealAddStepDisplay(_preparationSteps),
            MealAddIngredientDisplay(_ingredients),
          ],
        ),
      ),
    );
  }
}
