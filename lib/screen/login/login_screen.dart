import 'package:flutter/material.dart';
import 'package:habitly/data/api/auth_services.dart';
import 'package:habitly/static/navigation_route.dart';
import 'package:habitly/style/colors/habitly_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthServices authServices = AuthServices();
  bool isLoading = false;

  void _handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email atau Password tidak boleh kosong'),
          backgroundColor: HabitlyColors.destructive.color,
        ),
      );
    } else {
      setState(() {
        isLoading = true;
      });

      try {
        await authServices.login(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (!mounted) return;

        Navigator.pushNamedAndRemoveUntil(
          context,
          NavigationRoute.mainRoute.name,
          (route) => false,
        );
      } catch (e) {
        if (!mounted) return;

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi error'),
            backgroundColor: HabitlyColors.destructive.color,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 28, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),

                child: Image.asset('assets/plant.png', width: 30),
              ),

              SizedBox(height: 24),

              Text(
                'Welcome back',
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Your streaks are waiting patiently for you.',
                style: textTheme.bodyMedium,
              ),

              SizedBox(height: 24),

              Text('Email', style: textTheme.labelLarge),
              SizedBox(height: 4),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'you@example.com',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: Colors.black38,
                  ),
                ),
              ),

              SizedBox(height: 16),

              Text('Password', style: textTheme.labelLarge),
              SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                  hintText: '••••••••',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 20,
                    color: Colors.black38,
                  ),
                ),
              ),

              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),

              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 57,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: colorScheme.surface,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Sign in',
                          style: textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: 100,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.black26),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('or continue with', style: textTheme.bodyMedium),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(color: Colors.black26),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: colorScheme.primary,
                        elevation: 0,
                        side: BorderSide(color: Colors.black12),
                      ),
                      child: Text(
                        'Google',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: colorScheme.primary,
                        elevation: 0,
                        side: BorderSide(color: Colors.black12),
                      ),
                      child: Text(
                        'Apple',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 100),

              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'dont have an account? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
