import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';

import 'package:timesheet/presentation/widgets/leave/annual_statistic_item.dart';
import 'package:timesheet/presentation/utils/const.dart';

class AnnualStatisticBox extends StatelessWidget {
  const AnnualStatisticBox({
    super.key,
    required this.leaveQuota,
  });

  final LeaveQuotaEntity leaveQuota;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kColorLightGrey,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                spreadRadius: 0,
                offset: Offset(0, 0),
                blurRadius: 0),
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.14),
                spreadRadius: 0,
                offset: Offset(0, 1),
                blurRadius: 2),
          ]),
      child: AnnualStatisticData(
        leaveQuota: leaveQuota,
        showHeader: true,
        showHoliday: false,
        textColor: kColorGreyText,
      ),
    );
  }
}

class AnnualStatisticData extends StatelessWidget {
  const AnnualStatisticData(
      {super.key,
      required this.leaveQuota,
      required this.showHeader,
      required this.showHoliday,
      required this.textColor});

  final LeaveQuotaEntity leaveQuota;
  final bool showHeader;
  final bool showHoliday;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: showHeader,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Year',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const Spacer(),
                Text(
                  '${leaveQuota.renderYear}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
        ),
        AnnualStatisticItem(
          leaveTypes: LeaveTypes.sick,
          title: 'Sick leave',
          usedDays: leaveQuota.sickUsed,
          totalDays: leaveQuota.sickDay,
          showUnit: false,
          textColor: textColor,
        ),
        AnnualStatisticItem(
          leaveTypes: LeaveTypes.personal,
          title: 'Personal leave',
          usedDays: leaveQuota.personalUsed,
          totalDays: leaveQuota.personalDay,
          showUnit: false,
          textColor: textColor,
        ),
        AnnualStatisticItem(
          leaveTypes: LeaveTypes.annual,
          title: 'Annual leave',
          usedDays: leaveQuota.annualUsed,
          totalDays: leaveQuota.totalAnnualDays,
          showUnit: false,
          textColor: textColor,
        ),
        AnnualStatisticItem(
          leaveTypes: LeaveTypes.withoutPay,
          title: 'Without pay used',
          usedDays: leaveQuota.withoutPayDays,
          showUnit: showHoliday,
          textColor: textColor,
        ),
        AnnualStatisticItem(
          leaveTypes: LeaveTypes.special,
          title: 'Special leave',
          usedDays: leaveQuota.specialLeaveDays,
          showUnit: showHoliday,
          textColor: textColor,
        ),
        Visibility(
          visible: showHoliday,
          child: AnnualStatisticItem(
            leaveTypes: LeaveTypes.holiday,
            title: 'Holiday',
            showUnit: false,
            textColor: textColor,
          ),
        ),
      ],
    );
  }
}
