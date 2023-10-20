import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/models/leave_quota_model.dart';
import 'package:timesheet/pages/leave_tabs/annual_statistic_item.dart';
import 'package:timesheet/utils/const.dart';

class AnnualStatisticBox extends StatelessWidget {
  const AnnualStatisticBox({
    super.key,
    required this.leaveQuota,
  });

  final LeaveQuota leaveQuota;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kColorLighttGrey,
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
      child: Column(
        children: [
          Padding(
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
          AnnualStatisticItem(
            leaveTypes: LeaveTypes.sick,
            title: 'Sick leave',
            usedDays: leaveQuota.sickUsed,
            totalDays: leaveQuota.sickDay,
          ),
          AnnualStatisticItem(
            leaveTypes: LeaveTypes.personal,
            title: 'Personal leave',
            usedDays: leaveQuota.personalUsed,
            totalDays: leaveQuota.personalDay,
          ),
          AnnualStatisticItem(
            leaveTypes: LeaveTypes.annual,
            title: 'Annual leave',
            usedDays: leaveQuota.annualUsed,
            totalDays: leaveQuota.totalAnnualDays,
          ),
          AnnualStatisticItem(
            leaveTypes: LeaveTypes.withoutPay,
            title: 'Without pay used',
            usedDays: leaveQuota.withoutPayDays,
          ),
          AnnualStatisticItem(
            leaveTypes: LeaveTypes.special,
            title: 'Special leave',
            usedDays: leaveQuota.specialLeaveDays,
          ),
        ],
      ),
    );
  }
}
