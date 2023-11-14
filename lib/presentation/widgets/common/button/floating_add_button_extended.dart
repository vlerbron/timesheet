import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class FloatingAddButtonExtended extends StatelessWidget {
  const FloatingAddButtonExtended(
      {super.key, required this.onPressed, this.label = 'Add'});

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kWidgetPadding),
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        icon: const Icon(Icons.add),
        label: Text(label),
      ),
    );
  }
}
