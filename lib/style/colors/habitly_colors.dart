import 'package:flutter/material.dart';

enum HabitlyColors {
  green("Green", Color(0xFF4A9B8E)),
  cream("Cream", Color(0xFFF5F1E8));

  const HabitlyColors(this.name, this.color);
  final String name;
  final Color color;
}
