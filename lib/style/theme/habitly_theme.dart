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
      inputDecorationTheme: _inputDecorationTheme,
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
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: HabitlyColors.green.color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 14),
      hintStyle: HabitlyTextstyles.labelLarge.copyWith(color: Colors.black38),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: Colors.black12),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: Colors.black12),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: HabitlyColors.green.color, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}
