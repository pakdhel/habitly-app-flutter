import 'package:flutter/material.dart';
import 'package:habitly/screen/login/login_screen.dart';
import 'package:habitly/screen/main/onboarding_screen.dart';
import 'package:habitly/static/navigation_route.dart';
import 'package:habitly/style/theme/habitly_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HabitlyTheme.lightTheme,
      darkTheme: HabitlyTheme.darkTheme,
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (ctx) => OnboardingScreen(),
        NavigationRoute.loginRoute.name: (ctx) => LoginScreen(),
      },
    );
  }
}
