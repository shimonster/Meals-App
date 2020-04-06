import 'package:flutter/material.dart';


class MealAddCustomizeSettings extends StatelessWidget {
  final Map<String, bool> glutenFree;
  final Map<String, bool> lactoseFree;
  final Map<String, bool> vegan;
  final Map<String, bool> vegetarian;
  final Function handleSwitch;

  MealAddCustomizeSettings(this.glutenFree, this.lactoseFree, this.vegan, this.vegetarian, this.handleSwitch);


  @override
  Widget build(BuildContext context) {
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


    return Column(
      children: <Widget>[
        buildSwitchTile(
          'gluten-free',
          glutenFree['value'],
              (value) {
            handleSwitch(value, glutenFree);
          },
        ),
        buildSwitchTile(
          'vegan',
          vegan['value'],
              (value) {
                handleSwitch(value, vegan);
          },
        ),
        buildSwitchTile(
          'vegetarian',
          vegetarian['value'],
              (value) {
                handleSwitch(value, vegetarian);
          },
        ),
        buildSwitchTile(
          'lactose-free',
          lactoseFree['value'],
              (value) {
                handleSwitch(value, lactoseFree);
          },
        ),
      ],
    );
  }
}
