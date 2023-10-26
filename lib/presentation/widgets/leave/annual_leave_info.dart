import 'package:flutter/material.dart';

class AnnualLeaveInfo extends StatelessWidget {
  const AnnualLeaveInfo(
      {super.key,
      required this.title,
      required this.days,
      required this.color});
  final double days;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$days',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: color,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
