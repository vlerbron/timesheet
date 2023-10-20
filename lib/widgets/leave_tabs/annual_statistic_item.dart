import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/utils/const.dart';

class AnnualStatisticItem extends StatelessWidget {
  const AnnualStatisticItem({
    super.key,
    required this.leaveTypes,
    required this.title,
    required this.usedDays,
    this.totalDays,
  });
  final String title;
  final double usedDays;
  final double? totalDays;
  final LeaveTypes leaveTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: leaveTypesColor[leaveTypes]),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: kColorGreyText,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium!.fontSize),
              ),
            ],
          ),
          const Spacer(),
          Text(
            totalDays == null ? '$usedDays' : '$usedDays/$totalDays',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kColorGreyText,
                fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
          )
        ],
      ),
    );
  }
}
