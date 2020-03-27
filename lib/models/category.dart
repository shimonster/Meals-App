import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final Color lightColor;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.green,
    this.lightColor
  });
}
