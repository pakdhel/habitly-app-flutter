import 'package:flutter/material.dart';
import 'package:habitly/style/colors/habitly_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationOn = false;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile', style: textTheme.headlineLarge),
              SizedBox(height: 12),
              Card(
                color: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(36),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          'MH',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),

                      SizedBox(width: 16),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maya Rahman',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'maya@habitly.app',
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),
              Text(
                'Settings',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              Card(
                color: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(36),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 4),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HabitlyColors.tagLilac.color,
                          ),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        title: Text('Notifications'),
                        titleTextStyle: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: Switch(
                          value: isNotificationOn,
                          onChanged: (bool? value) {
                            setState(() {
                              isNotificationOn = value!;
                            });
                          },
                        ),
                      ),
                    ),

                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 12),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,

                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.dark_mode_outlined),
                        ),
                        title: Text('Dark Mode'),
                        titleTextStyle: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: Switch(
                          value: isDarkMode,
                          onChanged: (bool? value) {
                            setState(() {
                              isDarkMode = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.error.withOpacity(0.1),
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: colorScheme.error, width: 0.8),
                    iconColor: colorScheme.error,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded),
                      SizedBox(width: 8),
                      Text(
                        'Log out',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              Center(
                child: Text(
                  'Habitly v1.0 · Made with care',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.tertiary,
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
