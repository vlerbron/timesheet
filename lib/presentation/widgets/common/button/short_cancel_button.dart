import 'package:flutter/material.dart';

class ShortCancelButton extends StatelessWidget {
  const ShortCancelButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('Cancel'),
    );
  }
}
