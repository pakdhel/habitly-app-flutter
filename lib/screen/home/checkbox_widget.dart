import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
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
