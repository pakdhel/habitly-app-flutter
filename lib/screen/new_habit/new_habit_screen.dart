import 'package:flutter/material.dart';
import 'package:habitly/screen/new_habit/frequency_widget.dart';
import 'package:habitly/screen/new_habit/icon_select.dart';

class NewHabitScreen extends StatefulWidget {
  const NewHabitScreen({super.key});

  @override
  State<NewHabitScreen> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreen> {
  IconData? selectedIcon;
  String selectedFrequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('New Habit')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habit name',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'e.g. Meditate for 10 minutes',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

            SizedBox(height: 24),
            Text(
              'Icon',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            IconSelect(
              onIconSelected: (icon) {
                setState(() {
                  selectedIcon = icon;
                });
              },
            ),

            SizedBox(height: 24),

            Text(
              'Frequency',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),
            FrequencyWidget(
              onFrequencySelected: (value) {
                setState(() {
                  selectedFrequency = value;
                });
                print(selectedFrequency);
              },
            ),
          ],
        ),
      ),
    );
  }
}
