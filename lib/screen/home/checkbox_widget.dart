import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/models/habit.dart';
import 'package:habitly/data/providers/habits_provider.dart';
import 'package:habitly/data/providers/providers.dart';

class CheckboxWidget extends ConsumerStatefulWidget {
  final Habit habit;
  const CheckboxWidget({super.key, required this.habit});

  @override
  ConsumerState<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends ConsumerState<CheckboxWidget> {
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = widget.habit.completed;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () async {
        try {
          await ref
              .read(habitServicesProvider)
              .updateHabit(!isChecked, widget.habit.id);
        } catch (e) {}

        ref
            .read(habitsProvider.notifier)
            .toggleHabitLocally(widget.habit.id, !isChecked);

        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        // padding: EdgeInsets.all(4),
        width: 36,
        height: 36,
        decoration: isChecked
            ? BoxDecoration(
                color: colorScheme.primary.withAlpha(180),
                shape: BoxShape.circle,
              )
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black26, width: 2),
              ),
        child: isChecked ? Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}
