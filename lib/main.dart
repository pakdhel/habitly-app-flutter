import 'package:flutter/material.dart';
import 'package:habitly/screen/login/login_screen.dart';
import 'package:habitly/screen/main/main_screen.dart';
import 'package:habitly/screen/onboarding/onboarding_screen.dart';
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
      // darkTheme: HabitlyTheme.darkTheme,
      initialRoute: NavigationRoute.onBoarding.name,
      routes: {
        NavigationRoute.onBoarding.name: (ctx) => OnboardingScreen(),
        NavigationRoute.loginRoute.name: (ctx) => LoginScreen(),
        NavigationRoute.mainRoute.name: (ctx) => MainScreen(),
      },
    );
  }
}
