import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 2,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
