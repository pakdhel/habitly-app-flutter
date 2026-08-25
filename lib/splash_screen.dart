import 'package:flutter/material.dart';
import 'package:habitly/data/storage/token_storage.dart';
import 'package:habitly/static/navigation_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TokenStorage tokenStorage = TokenStorage();

  void _checkSession() async {
    try {
      final accessToken = await tokenStorage.readAccessToken();
      if (!mounted) return;

      if (accessToken != null) {
        Navigator.pushReplacementNamed(context, NavigationRoute.mainRoute.name);
      } else {
        Navigator.pushReplacementNamed(
          context,
          NavigationRoute.onBoarding.name,
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, NavigationRoute.onBoarding.name);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
