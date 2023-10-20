import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_model.dart';

class AnnualStatisticItem extends StatelessWidget {
  const AnnualStatisticItem(
      {super.key,
      required this.leaveTypes,
      required this.title,
      this.usedDays,
      this.totalDays,
      required this.showUnit,
      required this.textColor});
  final String title;
  final double? usedDays;
  final double? totalDays;
  final LeaveTypes leaveTypes;
  final bool showUnit;
  final Color textColor;

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
                    color: textColor,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium!.fontSize),
              ),
            ],
          ),
          const Spacer(),
          usedDays != null
              ? Row(
                  children: [
                    Text(
                      totalDays == null ? '$usedDays' : '$usedDays/$totalDays',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: textColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize),
                    ),
                    Visibility(
                      visible: showUnit,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          'used',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: textColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .fontSize),
                        ),
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
