import 'package:flutter/material.dart';

class MealAddIngredientDisplay extends StatefulWidget {
  final List<Map<String, String>> ingredients;

  MealAddIngredientDisplay(this.ingredients);

  @override
  _MealAddIngredientDisplayState createState() =>
      _MealAddIngredientDisplayState();
}

class _MealAddIngredientDisplayState extends State<MealAddIngredientDisplay> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 4,
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height * 2 / 5
          : MediaQuery.of(context).size.height * 2 / 7,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        border: Border.all(
          color: Colors.grey,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        itemCount: widget.ingredients.length,
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      OutlineButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_up),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
