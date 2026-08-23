import 'package:flutter/material.dart';

class FrequencyWidget extends StatefulWidget {
  final ValueChanged<String> onFrequencySelected;
  const FrequencyWidget({super.key, required this.onFrequencySelected});

  @override
  State<FrequencyWidget> createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  final List<String> options = ['Daily', 'Weekly'];
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(6),
      height: 56,
      decoration: BoxDecoration(
        color: colorScheme.outline.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: List.generate(options.length, (index) {
          final isSelected = indexSelected == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  indexSelected = index;
                });
                widget.onFrequencySelected(options[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isSelected ? colorScheme.primary : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    options[index],
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
        // children: [

        // Expanded(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(100),
        //       color: Colors.transparent,
        //     ),
        //     child: Center(
        //       child: Text(
        //         'Weekly',
        //         style: textTheme.bodyMedium?.copyWith(
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // ],
      ),
    );
  }
}
