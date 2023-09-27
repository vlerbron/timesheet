import 'package:flutter/material.dart';

class LongSubmitButton extends StatelessWidget {
  const LongSubmitButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 167,
          vertical: 15,
        ),
        backgroundColor: const Color.fromARGB(255, 30, 128, 184),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('Submit'),
    );
  }
}
