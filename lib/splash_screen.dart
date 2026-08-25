import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/providers/providers.dart';
import 'package:habitly/data/providers/user_provider.dart';
import 'package:habitly/static/navigation_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void _checkSession() async {
    try {
      final tokenStorage = ref.read(tokenStorageProvider);
      final accessToken = await tokenStorage.readAccessToken();

      if (!mounted) return;
      if (accessToken != null) {
        final user = await ref.read(authServicesProvider).getMe();
        ref.read(userProvider.notifier).setUser(user);

        if (!mounted) return;
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
