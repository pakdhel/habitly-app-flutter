import 'package:flutter/material.dart';
import 'package:habitly/style/colors/habitly_colors.dart';
import 'package:habitly/style/typography/habitly_textstyles.dart';

class HabitlyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: HabitlyColors.green.color,
      brightness: Brightness.light,
      scaffoldBackgroundColor: HabitlyColors.cream.color,
      useMaterial3: true,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: HabitlyColors.green.color,
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: HabitlyTextstyles.displayLarge,
      displayMedium: HabitlyTextstyles.displayMedium,
      displaySmall: HabitlyTextstyles.displaySmall,
      headlineLarge: HabitlyTextstyles.headlineLarge,
      headlineMedium: HabitlyTextstyles.headlineMedium,
      headlineSmall: HabitlyTextstyles.headlineSmall,
      titleLarge: HabitlyTextstyles.titleLarge,
      titleMedium: HabitlyTextstyles.titleMedium,
      titleSmall: HabitlyTextstyles.titleSmall,
      bodyLarge: HabitlyTextstyles.bodyLargeBold,
      bodyMedium: HabitlyTextstyles.bodyLargeMedium,
      bodySmall: HabitlyTextstyles.bodyLargeRegular,
      labelLarge: HabitlyTextstyles.labelLarge,
      labelMedium: HabitlyTextstyles.labelMedium,
      labelSmall: HabitlyTextstyles.labelSmall,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HabitlyColors.green.color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
