import 'package:flutter/material.dart';
import 'package:habitly/style/colors/habitly_colors.dart';
import 'package:habitly/style/typography/habitly_textstyles.dart';

class HabitlyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: HabitlyColors.primary.color,
        onPrimary: HabitlyColors.onPrimary.color,
        primaryContainer: HabitlyColors.primaryContainer.color,
        onPrimaryContainer: HabitlyColors.onPrimaryContainer.color,
        onSecondary: HabitlyColors.onPrimary.color,
        surface: HabitlyColors.surface.color,
        onSurface: HabitlyColors.textPrimary.color,
        outline: HabitlyColors.border.color,
        error: HabitlyColors.destructive.color,
        onError: HabitlyColors.onDestructive.color,
        tertiary: HabitlyColors.textSecondary.color,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: HabitlyColors.background.color,
      useMaterial3: true,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      cardTheme: _cardTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: HabitlyTextstyles.headlineLarge,
      titleLarge: HabitlyTextstyles.titleLarge,
      titleMedium: HabitlyTextstyles.titleMedium,
      bodyLarge: HabitlyTextstyles.bodyLargeBold,
      bodyMedium: HabitlyTextstyles.bodyLargeMedium,
      bodySmall: HabitlyTextstyles.bodyLargeRegular,
      labelLarge: HabitlyTextstyles.labelLarge,
      labelSmall: HabitlyTextstyles.labelSmall,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: HabitlyColors.primary.color,
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
        borderSide: BorderSide(color: HabitlyColors.outline.color, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  static CardThemeData get _cardTheme {
    return CardThemeData(color: HabitlyColors.primary.color);
  }
}
