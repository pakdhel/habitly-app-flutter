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
      dividerTheme: _dividerTheme,
      navigationBarTheme: _navigationBarThemeData,
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
      labelSmall: HabitlyTextstyles.labelSmall,
      labelMedium: HabitlyTextstyles.labelMedium,
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

  static DividerThemeData get _dividerTheme {
    return DividerThemeData(color: HabitlyColors.border.color);
  }

  static NavigationBarThemeData get _navigationBarThemeData {
    return NavigationBarThemeData(
      backgroundColor: HabitlyColors.surface.color,
      indicatorColor: HabitlyColors.primaryContainer.color,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: HabitlyColors.onPrimaryContainer.color);
        }

        return IconThemeData(color: HabitlyColors.textSecondary.color);
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return HabitlyTextstyles.labelMedium.copyWith(
            color: HabitlyColors.textPrimary.color,
            fontWeight: FontWeight.bold,
          );
        }

        return HabitlyTextstyles.labelMedium.copyWith(
          color: HabitlyColors.textSecondary.color,
        );
      }),
    );
  }
}
