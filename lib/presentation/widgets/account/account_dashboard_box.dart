import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class AccountDashboardBox extends StatelessWidget {
  const AccountDashboardBox(
      {super.key, required this.content, required this.title});

  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kColorLightBlue,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            content,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14),
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
          )
        ]),
      ),
    );
  }
}
