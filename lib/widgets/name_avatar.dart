import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  const NameAvatar(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor});

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      height: 22,
      width: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: textColor)),
      ),
    );
  }
}
