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
        await ref
            .read(habitServicesProvider)
            .updateHabit(!isChecked, widget.habit.id);

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
        decoration: BoxDecoration(
          color: isChecked ? colorScheme.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked ? colorScheme.primary : Colors.black26,
            width: 3,
          ),
        ),
        child: isChecked ? Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}
