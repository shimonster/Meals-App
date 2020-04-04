import 'package:flutter/material.dart';

class ButtonSelectionDisplay extends StatefulWidget {
  final List<Map<String, Object>> options;
  final bool canOnlySelectOne;
  final Function switchSelection;
  final Object whereOutput;

  ButtonSelectionDisplay(this.options, this.canOnlySelectOne,this.switchSelection , this.whereOutput);

  @override
  _ButtonSelectionDisplay createState() {
    print('ButtonSelectionDisplay was run');
    return _ButtonSelectionDisplay();
  }
}

class _ButtonSelectionDisplay extends State<ButtonSelectionDisplay> {


  @override
  Widget build(BuildContext context) {
    print('buttonSelecteion build() was run');
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, int index) {
        print('GridView.builder item builder was calld');
        return RaisedButton(
          child: widget.options[index]['input'],
          color: widget.options[index]['isSelected']
              ? Theme.of(context).primaryColor
              : Theme.of(context).accentColor,
          elevation: widget.options[index]['isSelected'] ? 10 : 0,
          onPressed: () {
            widget.switchSelection(
              index,
              widget.canOnlySelectOne,
              widget.whereOutput,
              widget.options,
            );
          },
        );
      },
//            IconButton(
//              icon: Icon(Icons.clear),
//              onPressed: () {
//                setState(() {
//                  widget.options.map((option) => option['isSelected'] = false);
//                });
//              },
//            ),
      itemCount: widget.options.length,
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
