import 'package:flutter/material.dart';


class MealAddCustomizeSettings extends StatefulWidget {
  bool glutenFree;
  bool lactoseFree;
  bool vegan;
  bool vegetarian;

  MealAddCustomizeSettings(this.glutenFree, this.lactoseFree, this.vegan, this.vegetarian);


  @override
  _MealAddCustomizeSettingsState createState() => _MealAddCustomizeSettingsState();
}

class _MealAddCustomizeSettingsState extends State<MealAddCustomizeSettings> {
  Widget buildSwitchTile(
      String typeString, bool controlValue, Function onSwitch) {
    return SwitchListTile(
      title: Text(typeString),
      subtitle: Text('This Meal is $typeString'),
      value: controlValue,
      activeColor: Theme.of(context).primaryColor,
      onChanged: onSwitch,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildSwitchTile(
          'gluten-free',
          widget.glutenFree,
              (value) {
            setState(() {
              widget.glutenFree = value;
              print('gluten free ${widget.glutenFree}');
            });
          },
        ),
        buildSwitchTile(
          'vegan',
          widget.vegan,
              (value) {
            setState(() {
              widget.vegan = value;
              print('vegan ${widget.vegan}');
            });
          },
        ),
        buildSwitchTile(
          'vegetarian',
          widget.vegetarian,
              (value) {
            setState(() {
              widget.vegetarian = value;
              print('vegetarian ${widget.vegetarian}');
            });
          },
        ),
        buildSwitchTile(
          'lactose-free',
          widget.lactoseFree,
              (value) {
            setState(() {
              widget.lactoseFree = value;
              print('lactose free ${widget.lactoseFree}');
            });
          },
        ),
      ],
    );
  }
}
