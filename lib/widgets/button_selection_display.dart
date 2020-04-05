import 'package:flutter/material.dart';

class ButtonSelectionDisplay extends StatelessWidget {
  final List<Map<String, Object>> options;
  final bool canOnlySelectOne;
  final Function switchSelection;
  final Object whereOutput;
  final Function clearSelected;

  ButtonSelectionDisplay(this.options, this.canOnlySelectOne,
      this.switchSelection, this.whereOutput, this.clearSelected);

  @override
  Widget build(BuildContext context) {
    print('buttonSelecteion build() was run');
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, int index) {
        return index >= options.length
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  clearSelected(options);
                })
            : RaisedButton(
                child: options[index]['input'],
                color: options[index]['isSelected']
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                elevation: options[index]['isSelected'] ? 10 : 0,
                onPressed: () {
                  switchSelection(
                    index,
                    canOnlySelectOne,
                    whereOutput,
                    options,
                  );
                },
              );
      },
      itemCount: options.length + 1,
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
