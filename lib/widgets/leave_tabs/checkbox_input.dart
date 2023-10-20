import 'package:flutter/material.dart';

class CheckboxInput extends StatelessWidget {
  const CheckboxInput(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});

  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            const Spacer(),
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
