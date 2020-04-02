import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealAddIngredientDisplay extends StatefulWidget {
  final List<Map<String, String>> ingredients;

  MealAddIngredientDisplay(this.ingredients);

  @override
  _MealAddIngredientDisplayState createState() =>
      _MealAddIngredientDisplayState();
}

class _MealAddIngredientDisplayState extends State<MealAddIngredientDisplay> {
  int get selectedIndexGet {
    print('length: ${widget.ingredients.length}');
    if (widget.ingredients.length == 0) {
      return 0;
    } else {
      return null;
    }
  }

  int selectedIndex;
  List<int> currentWholeNumbers;
  List<int> currentSixteenthNumerators;
  List<int> unitIndexes;
  List<String> possibleUnits;
  List<TextEditingController> ingredientNameControllers;

  @override
  void initState() {
    selectedIndex = selectedIndexGet;
    currentWholeNumbers = [0];
    currentSixteenthNumerators = [0];
    unitIndexes = [0];
    possibleUnits = [
      'Teaspoon',
      'Tablespoon',
      'Cup',
      'Fluid Oz.',
      'Pint',
      'Quart',
      'Gallon',
      'Millelitre',
      'Litre',
      'Gram',
      'Ounce',
      'Pinch',
    ];
    ingredientNameControllers = [TextEditingController()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildNumberCustomizer(int min, int max, int increment, int index,
        List list, Widget renderWidget) {
      return Column(
        children: <Widget>[
          IconButton(
            onPressed: list[index] < max
                ? () {
                    setState(() {
                      list[index] += increment;
                    });
                  }
                : null,
            icon: Icon(Icons.keyboard_arrow_up),
          ),
          renderWidget,
          IconButton(
            onPressed: list[index] > min
                ? () {
                    setState(() {
                      list[index] -= increment;
                    });
                  }
                : null,
            icon: Icon(Icons.keyboard_arrow_down),
          ),
        ],
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width * 9/10,
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
        itemCount: ingredientNameControllers.length,
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: selectedIndex != index
                ? () {
                    setState(() {
                      selectedIndex = index;
                    });
                  }
                : null,
            child: Card(
              child: selectedIndex == index
                  ? Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 5 / 8,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildNumberCustomizer(
                              0,
                              currentWholeNumbers[index] + 1,
                              1,
                              index,
                              currentWholeNumbers,
                              Text(
                                currentWholeNumbers[index].toString(),
                                style: Theme.of(context).textTheme.subtitle,
                              )),
                          _buildNumberCustomizer(
                              0,
                              15,
                              1,
                              index,
                              currentSixteenthNumerators,
                              Text(
                                '${currentSixteenthNumerators[index]}/16',
                                style: Theme.of(context).textTheme.subtitle,
                              )),
                          _buildNumberCustomizer(
                            0,
                            possibleUnits.length - 1,
                            1,
                            index,
                            unitIndexes,
                            Container(
                              width: 80,
                              height: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .fontSize +
                                  2,
                              child: FittedBox(
                                child: Text(
                                  possibleUnits[unitIndexes[index]],
                                  style: Theme.of(context).textTheme.subtitle,
//                          overflow: TextOverflow.,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: TextField(
                                  controller: ingredientNameControllers[index],
                                  decoration: InputDecoration(
                                    labelText: 'Ingredient Name',
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.check, color: Colors.green,),
                                    onPressed: () {
                                      setState(() {
                                        currentWholeNumbers.add(0);
                                        currentSixteenthNumerators.add(0);
                                        unitIndexes.add(0);
                                        ingredientNameControllers
                                            .add(TextEditingController());
                                        if (widget.ingredients.length - 1 < index) {
                                        } else {
                                          print('tried to remove');
                                          widget.ingredients.removeAt(index);
                                        }
                                        widget.ingredients.add({
                                          'amount': currentSixteenthNumerators[
                                                      index] ==
                                                  0
                                              ? '${currentWholeNumbers[index]} ${possibleUnits[unitIndexes[index]]} '
                                              : '${currentWholeNumbers[index]} ${currentSixteenthNumerators[index]}/16 ${possibleUnits[unitIndexes[index]]} ',
                                          'ingredient':
                                              ingredientNameControllers[index].text
                                        });
                                        selectedIndex = index + 1;
                                      });
                                      print(widget.ingredients);
                                    },
                                  ),
                                  if (widget.ingredients.length != 0)IconButton(
                                    icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                                    onPressed: () {
                                      setState(() {
                                        currentWholeNumbers.removeAt(index);
                                        currentSixteenthNumerators.removeAt(index);
                                        unitIndexes.removeAt(index);
                                        ingredientNameControllers
                                            .removeAt(index);
                                        if (widget.ingredients.length - 1 < index) {
                                        } else {
                                          widget.ingredients.removeAt(index);
                                        }
                                        //selectedIndex = index - 1;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                currentSixteenthNumerators[index] == 0
                                    ? '${currentWholeNumbers[index]} ${possibleUnits[unitIndexes[index]]} '
                                    : '${currentWholeNumbers[index]} ${currentSixteenthNumerators[index]}/16 ${possibleUnits[unitIndexes[index]]} ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              child: Text(
                                ingredientNameControllers[index].text == ''
                                    ? 'Nothing'
                                    : ingredientNameControllers[index].text,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
