import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class AccountDashboardItem extends StatelessWidget {
  const AccountDashboardItem(
      {super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kColorGreyText, fontSize: 14),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(content),
      ],
    );
  }
}
