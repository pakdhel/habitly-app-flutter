import 'package:flutter/material.dart';

class ColorUtils {
  static Color darken(Color color, [double amount = 0.3]) {
    final hsl = HSLColor.fromColor(color);
    final darkerHsl = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkerHsl.toColor();
  }
}
