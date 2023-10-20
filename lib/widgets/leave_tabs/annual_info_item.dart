import 'package:flutter/material.dart';

class AnnualInfoItem extends StatelessWidget {
  const AnnualInfoItem({super.key, required this.title, required this.days});
  final String title;
  final double days;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
          ),
          const Spacer(),
          Text(
            '$days',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
          ),
        ],
      ),
    );
  }
}
