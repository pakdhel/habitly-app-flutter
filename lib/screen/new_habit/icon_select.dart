import 'package:flutter/material.dart';

class IconSelect extends StatefulWidget {
  final ValueChanged<IconData> onIconSelected;
  const IconSelect({super.key, required this.onIconSelected});

  @override
  State<IconSelect> createState() => _IconSelectState();
}

class _IconSelectState extends State<IconSelect> {
  final List<IconData> icons = [
    Icons.eco_outlined,
    Icons.water_drop_outlined,
    Icons.fitness_center_outlined,
    Icons.menu_book,
    Icons.directions_walk_rounded,
    // Icon(Icons.,)
  ];

  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(icons.length, (index) {
        final isSelected = indexSelected == index;
        return GestureDetector(
          onTap: () {
            setState(() { 
              indexSelected = index;
            });

            widget.onIconSelected(icons[index]);

            print(indexSelected);
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
              icons[index],
              color: isSelected
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.tertiary,
            ),
          ),
        );
      }),
    );
  }
}
