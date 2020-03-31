import 'package:flutter/material.dart';

class ColorSelectorDisplay extends StatelessWidget {
  final List<Map<String, Object>> possibleColors;
  final Function  selectColor;

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
            color: color,
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: possibleColors.map((color) {
            var colorIndex = possibleColors.indexWhere((clr) => clr == color);
            return colorDisplay(color['color'], color['selected'] ? 5 : 1, colorIndex);
          }).toList(),
        ),
      ),
    );
  }
}
