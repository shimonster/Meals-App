import 'package:flutter/material.dart';

class ButtonSelectionDisplay extends StatefulWidget {
  final List<Map<String, Object>> options;
  final bool canOnlySelectOne;
  final Function switchSelection;
  final Object basedOnObject;

  ButtonSelectionDisplay(this.options, this.canOnlySelectOne,
      this.switchSelection, this.basedOnObject);

  @override
  _ButtonSelectionDisplay createState() => _ButtonSelectionDisplay();
}

class _ButtonSelectionDisplay extends State<ButtonSelectionDisplay> {

  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        ...widget.options.map((option) {
          var thisIndex =
              widget.options.indexWhere((thisOption) => thisOption == option);
          return RaisedButton(
            child: option['input'],
            color: option['isSelected']
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            elevation: option['isSelected']
                ? 10
                : 0,
            onPressed: () {
              widget.switchSelection(
                  thisIndex,
                  option,
                  widget.canOnlySelectOne,
                  widget.basedOnObject,
                  widget.options);
            },
          );
        }).toList(),
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              widget.options.map((option) => option['isSelected'] = false);
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
