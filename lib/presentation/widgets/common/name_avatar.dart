import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  const NameAvatar(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.size});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      height: size ?? 22,
      width: size ?? 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size != null ? size! / 2 : 11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: textColor, fontSize: size != null ? size! / 2 : 11)),
      ),
    );
  }
}
