import 'package:flutter/material.dart';

class ReminderTimeWidget extends StatefulWidget {
  final ValueChanged<TimeOfDay> onTimeSelected;
  const ReminderTimeWidget({super.key, required this.onTimeSelected});

  @override
  State<ReminderTimeWidget> createState() => _ReminderTimeWidgetState();
}

class _ReminderTimeWidgetState extends State<ReminderTimeWidget> {
  TimeOfDay? timeOfDay;
  static const TimeOfDay _defaultTime = TimeOfDay(hour: 8, minute: 0);

  Future<void> timePicker() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay ?? _defaultTime,
    );

    if (newTime != null) {
      setState(() {
        timeOfDay = newTime;
      });

      widget.onTimeSelected(newTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: timePicker,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Row(
          children: [
            Icon(Icons.notifications_none_rounded, color: colorScheme.tertiary),
            SizedBox(width: 12),
            Text(
              timeOfDay == null
                  ? _defaultTime.format(context)
                  : timeOfDay!.format(context),

              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Icon(Icons.alarm),
          ],
        ),
      ),
    );
  }
}
