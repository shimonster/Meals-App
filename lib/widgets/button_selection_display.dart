import 'package:flutter/material.dart';


class ButtonSelectionDisplay extends StatefulWidget {
  final List<Map<String, Object>> options;
  final Function switchInputOutput;
  final bool canOnlySelectOne;

  ButtonSelectionDisplay(
      this.options, this.switchInputOutput, this.canOnlySelectOne);

  @override
  _ButtonSelectionDisplay createState() => _ButtonSelectionDisplay();
}

class _ButtonSelectionDisplay extends State<ButtonSelectionDisplay> {
  int selectedItemIndex; // used if can only select one
  List<int> selectedItems = []; // used if can select more than one

  void switchSelection(int thisIdx, Map<String, Object> thisOption) {
    setState(() {
      if (widget.canOnlySelectOne) {
        if (selectedItemIndex != thisIdx) {
          selectedItemIndex = thisIdx;
        } else {
          selectedItemIndex = null;
        }
      } else {
        if (!selectedItems.contains(thisIdx)) {
          selectedItems.add(thisIdx);
        } else {
          selectedItems.removeWhere((index) => index == thisIdx);
        }
      }
      widget.switchInputOutput(thisOption['output']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        ...widget.options.map((option) {
          var thisIndex =
          widget.options.indexWhere((thisOption) => thisOption == option);
          print(thisIndex);
          return RaisedButton(
            child: option['input'],
            color: selectedItemIndex == thisIndex ||
                selectedItems.contains(thisIndex)
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            elevation: selectedItemIndex == thisIndex ||
                selectedItems.contains(thisIndex) ? 10 : 0,
            onPressed: () {
              switchSelection(thisIndex, option);
            },
          );
        }).toList(),
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              selectedItemIndex = null;
              selectedItems = [];
            });
          },
        )
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: EdgeInsets.all(15),
    );
  }
}