import 'package:flutter/material.dart';
import 'package:timesheet/main.dart';
import 'package:timesheet/presentation/utils/const.dart';

class ProjectFilter extends StatelessWidget {
  const ProjectFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(
          bottom: kWidgetPadding,
          left: kWidgetSpaceSmall,
          right: kWidgetSpaceSmall),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 81,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  backgroundColor: kColorLightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Issues',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(
              width: kWidgetSpaceSmall,
            ),
            SizedBox(
              width: 115,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: kColorGreyText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: const BorderSide(color: kColorDarkGrey),
                ),
                child: Text(
                  'System architecture',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(
              width: kWidgetSpaceSmall,
            ),
            SizedBox(
              width: 113,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: kColorGreyText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: const BorderSide(color: kColorDarkGrey),
                ),
                child: Text(
                  'Deployment plans',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(
              width: kWidgetSpaceSmall,
            ),
            SizedBox(
              width: 75,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: kColorGreyText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: const BorderSide(color: kColorDarkGrey),
                ),
                child: Text(
                  'Note',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
