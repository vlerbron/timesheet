import 'package:flutter/material.dart';

class AccountDashboardHeader extends StatelessWidget {
  const AccountDashboardHeader(
      {super.key, required this.iconPath, required this.title});

  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: 22,
          width: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16, color: Theme.of(context).colorScheme.onBackground),
        )
      ],
    );
  }
}
