import 'package:flutter/material.dart';

import '../widgets/drawer_display.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'screen': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'screen': FavoritesScreen(),
      'title': 'Favorites',
    }
  ];
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
