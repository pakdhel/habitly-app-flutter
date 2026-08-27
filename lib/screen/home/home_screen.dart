import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/providers/habits_provider.dart';
import 'package:habitly/data/providers/user_provider.dart';
import 'package:habitly/screen/home/habit_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final habitsAsync = ref.watch(habitsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saturday, August 22'),
                      Text(
                        'Hi, ${user?.firstName} 👋',
                        style: textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer,
                  ),
                  child: Text(
                    user == null
                        ? ''
                        : '${user.firstName[0]}${user.lastName[0]}',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(36),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You\'re doing great, keep it gentle',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2 of 5 habits',
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s habits',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('5 Total', style: textTheme.bodySmall),
              ],
            ),

            SizedBox(height: 6),

            habitsAsync.when(
              data: (habits) => Column(
                children: habits
                    .map((habit) => HabitCardWidget(habit: habit))
                    .toList(),
              ),
              error: (err, stack) => Text('Gagal membuat: $err'),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.pushNamed(context, "/new");
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
