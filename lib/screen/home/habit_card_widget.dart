import 'package:flutter/material.dart';
import 'package:habitly/data/models/habit.dart';
import 'package:habitly/screen/home/checkbox_widget.dart';
import 'package:habitly/static/color_hex_converter.dart';
import 'package:habitly/static/color_utils.dart';
import 'package:habitly/static/habit_icons.dart';

class HabitCardWidget extends StatelessWidget {
  final Habit habit;
  const HabitCardWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final baseColor = habit.colorTag != null
        ? ColorHexConverter.hexToColor(habit.colorTag!)
        : Colors.greenAccent;

    final displayColor = habit.completed ? baseColor.withAlpha(100) : baseColor;
    final iconColor = ColorUtils.darken(baseColor);
    final displayIconColor = habit.completed
        ? iconColor.withAlpha(100)
        : iconColor;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: habit.completed
            ? colorScheme.surface.withAlpha(100)
            : colorScheme.surface,
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
                        color: displayColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        HabitIcons.icons[habit.icon] ??
                            HabitIcons.icons['eco_outlined'],
                        color: displayIconColor,
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habit.name,
                            style: habit.completed
                                ? textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black26,
                                  )
                                : textTheme.bodyLarge?.copyWith(
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
