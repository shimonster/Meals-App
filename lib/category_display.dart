import 'package:flutter/material.dart';

class CategoryDisplay extends StatelessWidget {
  final String title;
  final Color color;

  CategoryDisplay(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(title, style: Theme.of(context).textTheme.title,),
    );
  }
}
