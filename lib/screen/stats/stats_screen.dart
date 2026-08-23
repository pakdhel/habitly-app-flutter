import 'package:flutter/material.dart';
import 'package:habitly/screen/stats/list_tile_habit_widget.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

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
              Text('Your progress', style: textTheme.headlineLarge),
              SizedBox(height: 4),
              Text(
                'Last 30 days, at a glance.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.tertiary,
                ),
              ),

              SizedBox(height: 20),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        color: colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '74%',
                                style: textTheme.displayLarge?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Completion Rate',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 4),

                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        color: colorScheme.surface,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.trending_up_rounded,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '48',
                                style: textTheme.headlineMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Total streak days',
                                style: textTheme.titleSmall?.copyWith(
                                  color: colorScheme.tertiary,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              Text(
                'All habits',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),

              ListTileHabitWidget(),
              SizedBox(height: 4),
              ListTileHabitWidget(),
              SizedBox(height: 4),
              ListTileHabitWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
