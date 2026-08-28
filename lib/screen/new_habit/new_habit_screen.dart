import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/providers/habits_provider.dart';
import 'package:habitly/data/providers/providers.dart';
import 'package:habitly/data/providers/user_provider.dart';
import 'package:habitly/screen/new_habit/color_tag_widget.dart';
import 'package:habitly/screen/new_habit/frequency_widget.dart';
import 'package:habitly/screen/new_habit/icon_select.dart';
import 'package:habitly/screen/new_habit/reminder_time_widget.dart';
import 'package:habitly/static/color_hex_converter.dart';
import 'package:habitly/style/colors/habitly_colors.dart';

class NewHabitScreen extends ConsumerStatefulWidget {
  const NewHabitScreen({super.key});

  @override
  ConsumerState<NewHabitScreen> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends ConsumerState<NewHabitScreen> {
  // IconData? selectedIcon;
  String selectedFrequency = 'Daily';
  Color? colorTag;
  TimeOfDay? reminderTime;
  String? selectedIconName;

  TextEditingController habitNameController = TextEditingController();

  void _handleSaveHabit() async {
    if (habitNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Habit name cannot be empty'),
          backgroundColor: HabitlyColors.destructive.color,
        ),
      );
    } else {
      final user = ref.read(userProvider);
      if (user == null) return;
      final newHabit = await ref
          .read(habitServicesProvider)
          .addHabit(habitNameController.text, user.id);

      final habitLocal = newHabit.copyWith(
        icon: selectedIconName,
        frequency: selectedFrequency,
        colorTag: colorTag != null
            ? ColorHexConverter.colorToHex(colorTag!)
            : null,
      );
      ref.read(habitsProvider.notifier).addHabitLocally(habitLocal);

      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14, top: 16),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(Icons.arrow_back_rounded),
                      ),
                    ),
                    SizedBox(width: 24),
                    Text(
                      'New habit',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                      controller: habitNameController,
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
                          selectedIconName = icon;
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

                    SizedBox(height: 24),
                    Text(
                      'Reminder time',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),
                    ReminderTimeWidget(
                      onTimeSelected: (time) {
                        setState(() {
                          reminderTime = time;
                        });
                      },
                    ),

                    SizedBox(height: 24),
                    Text(
                      'Color tag',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),
                    ColorTagWidget(
                      onSelectedColor: (value) {
                        setState(() {
                          colorTag = value;
                        });
                      },
                    ),

                    SizedBox(height: 36),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleSaveHabit,
                        child: Text(
                          'Save habit',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
