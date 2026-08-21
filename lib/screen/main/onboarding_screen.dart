import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('H A B I T L Y', style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 20),
            Image.asset(
              'assets/onboarding.png',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Small steps, every single day',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Column(children: []),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
