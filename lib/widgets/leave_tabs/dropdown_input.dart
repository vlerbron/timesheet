import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class DropdownInput extends StatelessWidget {
  const DropdownInput(
      {super.key,
      required this.items,
      required this.title,
      required this.selectedValue,
      required this.onChanged});

  final List<DropdownMenuItem> items;
  final String title;
  final dynamic selectedValue;
  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(
                  title,
                ),
                const Text(
                  '*',
                  style: kRequiredTextStyle,
                )
              ],
            ),
            const Spacer(),
            Expanded(
              flex: 0,
              child: DropdownButton(
                  underline: const Text(''),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                  value: selectedValue,
                  items: items,
                  onChanged: onChanged),
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
