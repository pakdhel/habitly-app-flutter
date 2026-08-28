import 'package:flutter/material.dart';
import 'package:habitly/static/habit_icons.dart';

class IconSelect extends StatefulWidget {
  final ValueChanged<String> onIconSelected;
  const IconSelect({super.key, required this.onIconSelected});

  @override
  State<IconSelect> createState() => _IconSelectState();
}

class _IconSelectState extends State<IconSelect> {
    
  String? selectedIconName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: HabitIcons.icons.entries.map((entry) {
        final name = entry.key;
        final iconData = entry.value;

        final isSelected = selectedIconName == name;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIconName = name;
            });

            widget.onIconSelected(name);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: isSelected
                  ? colorScheme.primaryContainer
                  : colorScheme.surface,
              border: isSelected
                  ? Border.all(color: colorScheme.onPrimaryContainer)
                  : Border.all(color: colorScheme.outline),
            ),
            child: Icon(
              iconData,
              color: isSelected
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.tertiary,
            ),
          ),
        );
      }).toList(),
    );
  }
}
