import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegan = false;
  var vegetarian = false;

  Widget buildSwitchTile(String typeString, bool controlValue,
      Function onSwitch) {
    return SwitchListTile(
      title: Text(typeString),
      subtitle: Text('Only display meals that are $typeString'),
      value: controlValue,
      activeColor: Theme
          .of(context)
          .primaryColor,
      onChanged: onSwitch,
    );
  }

@override
Widget build(BuildContext context) {
  print([glutenFree, vegan, vegetarian, lactoseFree]);
  return Scaffold(
    appBar: AppBar(
      title: Text('Filters'),
    ),
    body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust Meals Shown',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
        buildSwitchTile(
          'gluten-free',
          glutenFree,
              (value) {
            setState(() {
              glutenFree = value;
            });
          },
        ),
        buildSwitchTile(
          'vegan',
          vegan,
              (value) {
            setState(() {
              vegan = value;
            });
          },
        ),
        buildSwitchTile(
          'vegetarian',
          vegetarian,
              (value) {
            setState(() {
              vegetarian = value;
            });
          },
        ),
        buildSwitchTile(
          'lactose-free',
          lactoseFree,
              (value) {
            setState(() {
              lactoseFree = value;
            });
          },
        ),
      ],
    ),
  );
}}
