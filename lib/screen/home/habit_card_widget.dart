import 'package:flutter/material.dart';
import 'package:habitly/data/models/habit.dart';
import 'package:habitly/screen/home/checkbox_widget.dart';
import 'package:habitly/static/color_hex_converter.dart';
import 'package:habitly/static/habit_icons.dart';

class HabitCardWidget extends StatelessWidget {
  final Habit habit;
  const HabitCardWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(36),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: habit.colorTag != null
                            ? ColorHexConverter.hexToColor(habit.colorTag!)
                            : Colors.greenAccent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        HabitIcons.icons[habit.icon] ??
                            HabitIcons.icons['eco_outlined'],
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habit.name,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Row(
                            children: [
                              Image.asset('assets/icons/burn.png', width: 14),
                              SizedBox(width: 6),
                              Text(
                                '5 days streak',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.tertiary,
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                habit.frequency ?? 'Daily',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              CheckboxWidget(habit: habit),
            ],
          ),
        ),
      ),
    );
  }
}
