import 'dart:ui';

class ColorHexConverter {
  static String colorToHex(Color color) {
    final r = (color.r * 255).round().toRadixString(16).padLeft(2, '0');
    final g = (color.g * 255).round().toRadixString(16).padLeft(2, '0');
    final b = (color.b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$r$g$b'.toUpperCase();
  }

  static Color hexToColor(String hex) {
    final hexCode = hex.replaceAll('#', ''); // buang tanda '#'
    return Color(
      int.parse('FF$hexCode', radix: 16),
    ); // FF di depan = alpha 100%
  }
}
