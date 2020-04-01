import 'package:flutter/material.dart';

class ColorSelectorDisplay extends StatelessWidget {
  final List<Map<String, Object>> possibleColors;
  final Function selectColor;

  ColorSelectorDisplay(this.possibleColors, this.selectColor);

  Widget colorDisplay(Color color, double borderWidth, int index) {
    return GestureDetector(
      onTap: () => selectColor(index),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.4), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.grey[800],
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: possibleColors.map((color) {
            var colorIndex = possibleColors.indexWhere((clr) => clr == color);
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: BoxDecoration(
                border: color['selected']
                    ? Border(
                        bottom: BorderSide(
                          width: 4,
                          color: color['color'],
                        ),
                      )
                    : Border(),
              ),
              child: colorDisplay(color['color'],
                  /*color['selected'] ? 3 : */ 1, colorIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}
