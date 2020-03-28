import 'package:flutter/material.dart';

class DrawerDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 55 + MediaQuery.of(context).padding.top,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, left: 10),
              child: Text(
                'Navigator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: FlatButton(
              child: Text('Home'),
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: FlatButton(
              child: Text('Settings'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
