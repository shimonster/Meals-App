import 'package:flutter/material.dart';

class ColorSelectorDisplay extends StatelessWidget {
  final List<Map<String, Object>> possibleColors;
  final Function selectColor;

  ColorSelectorDisplay(this.possibleColors, this.selectColor);


  Widget colorDisplay(Color color, double borderWidth, int index) {
    return GestureDetector(
      onTap: () => selectColor(index),
      child: Container(
        height: 30,
        width: 30,
        color: color,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: possibleColors.map((color) {
          var colorIndex = possibleColors.indexWhere((clr) => clr == color);
          return colorDisplay(color['color'], color['selected'] ? 5 : 1, colorIndex);
        }).toList(),
      ),
    );
  }
}
