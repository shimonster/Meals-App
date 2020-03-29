import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class DrawerDisplay extends StatelessWidget {
  Widget buildListTile (String text, IconData icon, Function screenChange) {
    return ListTile(
      onTap: screenChange,
      leading: Icon(icon, size: 28,),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 55 + MediaQuery.of(context).padding.top,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 10),
            child: Text(
              'Navigator',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 5,),
          buildListTile('Home', Icons.restaurant_menu, () {Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Filters', Icons.settings, () {Navigator.of(context).pushNamed(FiltersScreen.screenRoute);}),
        ],
      ),
    );
  }
}
