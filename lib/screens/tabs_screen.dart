import 'package:flutter/material.dart';

import '../widgets/drawer_display.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final Function addCategory;
  final List<Category> allCategories;

  TabsScreen(this.favoriteMeals, this.addCategory, this.allCategories);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedTabIndex = 0;



  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      _pages = [
        {
          'screen': CategoriesScreen(widget.addCategory, widget.allCategories),
          'title': 'Categories',
        },
        {
          'screen': FavoritesScreen(widget.favoriteMeals),
          'title': 'Favorites',
        },
      ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTabIndex]['title']),
      ),
      drawer: DrawerDisplay(),
      body: _pages[_selectedTabIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedTabIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
            backgroundColor: Theme.of(context).primaryColorDark,
          )
        ],
      ),
    );
  }
}
