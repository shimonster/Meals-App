import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meal.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c2',
    title: 'Chinese',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Indian',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Mexican',
    color: Colors.green,
  ),
  Category(
    id: 'c5',
    title: 'Dessert',
    color: Colors.brown,
  ),
  Category(
    id: 'c6',
    title: 'Quick',
    color: Colors.purple,
  ),
  Category(
    id: 'c7',
    title: 'Big Meals',
    color: Colors.teal,
  ),
  Category(
    id: 'c8',
    title: 'Road Trip',
    color: Colors.amber,
  ),
  Category(
    id: 'c9',
    title: 'Simple',
    color: Colors.pinkAccent,
  ),
  Category(
    id: 'c10',
    title: 'Small',
    color: Colors.deepOrangeAccent,
  ),
];


const DUMMY_RECIPES = [
  Meal(
    id: 'm1',
    name: 'Fried Rice',
    categories: ['Chinese', 'Quick', 'Road Trip'],
    ingredients: [
      {
        'amount': '3 cups',
        'ingredient': 'rice',
      },
      {
        'amount': '1/2 cup',
        'ingredient': 'Green Peas',
      },
      {
        'amount': '1/2 cup',
        'ingredient': 'Finely Chopped Carrets',
      },
      {
        'amount': '2 TBS',
        'ingredient': 'Soy Sauce',
      },
    ],
    preparationSteps: [
      'Cook rice for 20 minutes',
      'Mix in green peas and carrets',
      'Cook all together for 5 more minutes',
      'Add soy sauce and serve'
    ],
    servings: Servings.Some,
    timeToMake: TimeToMake.Quick,
    imageURL: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/1/11/0/KC1912_Bacon-and-Egg-Fried-Rice_s4x3.jpg.rend.hgtvcom.826.620.suffix/1547241481011.jpeg',
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: 'm2',
    name: 'Chicken Omlet',
    categories: ['Meat', 'Quick'],
    ingredients: [
      {
        'amount': '3',
        'ingredient': 'Eggs',
      },
      {
        'amount': '1/2 cups',
        'ingredient': 'Ripped Up Chicken',
      },
    ],
    preparationSteps: [
      'Beat eggs',
      'Mix in chicken',
      'Pour mixture on pan',
      'Wait for 5 minutes',
      'Put on plate and serve'
    ],
    servings: Servings.One,
    timeToMake: TimeToMake.Some,
    imageURL: 'https://x9wsr1khhgk5pxnq1f1r8kye-wpengine.netdna-ssl.com/wp-content/uploads/basic-french-omelet-930x550.jpg',
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: true,
    isVegetarian: false,
  ),
  Meal(
    id: 'm3',
    name: 'Muffins',
    categories: ['Road Trip', 'Quick', 'Small', 'Simple'],
    ingredients: [
      {
        'amount': '2 cups',
        'ingredient': 'Water',
      },
      {
        'amount': '4 cups',
        'ingredient': 'Muffin Mix',
      },
    ],
    preparationSteps: [
      'Mix muffin mix and water in large bowl',
      'Distribute mixtrue into muffin pan',
      'Bake at 400 degrees for 20 minutes',
      'Wait for it to cool and serve'
    ],
    servings: Servings.Lots,
    timeToMake: TimeToMake.Long,
    imageURL: 'https://www.rockrecipes.com/wp-content/uploads/2008/03/Sweet-Potato-Spice-Muffins-square-cropped-featured-image.jpg',
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: true,
    isVegetarian: true,
  ),
];
