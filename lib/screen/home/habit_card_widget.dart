import 'package:flutter/material.dart';
import 'package:habitly/screen/home/checkbox_widget.dart';

class HabitCardWidget extends StatelessWidget {
  const HabitCardWidget({super.key});

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
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.menu_book_rounded),
                  ),

                  SizedBox(width: 14),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Morning Stretch',
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
                            'Daily',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              CheckboxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
