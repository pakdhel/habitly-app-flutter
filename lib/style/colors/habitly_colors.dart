import 'package:flutter/material.dart';

enum HabitlyColors {
  green("Green", Colors.greenAccent);

  const HabitlyColors(this.name, this.color);
  final String name;
  final Color color;
}
