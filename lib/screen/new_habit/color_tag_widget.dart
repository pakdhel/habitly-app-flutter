import 'package:flutter/material.dart';
import 'package:habitly/style/colors/habitly_colors.dart';

class ColorTagWidget extends StatefulWidget {
  final ValueChanged<Color> onSelectedColor;
  const ColorTagWidget({super.key, required this.onSelectedColor});

  @override
  State<ColorTagWidget> createState() => _ColorTagWidgetState();
}

class _ColorTagWidgetState extends State<ColorTagWidget> {
  int? indexSelected;

  final List<HabitlyColors> colors = [
    HabitlyColors.primary,
    HabitlyColors.tagFlame,
    HabitlyColors.tagLilac,
    HabitlyColors.tagSand,
    HabitlyColors.tagSky,
  ];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,

      children: List.generate(colors.length, (index) {
        final isSelected = indexSelected == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              indexSelected = index;
            });
            widget.onSelectedColor(colors[index].color);
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.tertiary : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colors[index].color,
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.surface, width: 3),
              ),
            ),
          ),
        );
      }),
    );
  }
}
