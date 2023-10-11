import 'package:flutter/material.dart';
import 'package:timesheet/utils/const.dart';

class LongSubmitButton extends StatelessWidget {
  const LongSubmitButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 167,
                vertical: 15,
              ),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kWidgetCircularRadius),
              ),
            ),
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
