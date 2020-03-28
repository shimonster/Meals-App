import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  int _selectedTabIndex = 0;

  void _selectTab (int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: _pages[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('Categories'),),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Favorites'),)
        ],
      ),
    );
  }
}
