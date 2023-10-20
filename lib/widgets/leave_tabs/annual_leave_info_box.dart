import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_quota_model.dart';
import 'package:timesheet/widgets/leave_tabs/annual_info_item.dart';
import 'package:timesheet/widgets/leave_tabs/annual_leave_info.dart';
import 'package:timesheet/widgets/leave_tabs/annual_leave_info_banner.dart';
import 'package:timesheet/utils/const.dart';

class AnnualLeaveInfoBox extends StatelessWidget {
  const AnnualLeaveInfoBox({
    super.key,
    required this.leaveQuota,
  });

  final LeaveQuota leaveQuota;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kColorLightBlue,
      ),
      child: Column(
        children: [
          AnnualLeaveInfoBanner(
            year: leaveQuota.renderYear,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: AnnualLeaveInfo(
                  title: 'Total Annual Days',
                  days: leaveQuota.totalAnnualDays,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AnnualLeaveInfo(
                  title: 'Annual Used',
                  days: leaveQuota.annualUsed,
                  color: kColorLightGreen,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AnnualInfoItem(
            title: 'Annual Remain',
            days: leaveQuota.annualRemain,
          ),
          AnnualInfoItem(
            title: 'Annual Days',
            days: leaveQuota.annualDay,
          ),
          AnnualInfoItem(
            title: 'Annual Carried',
            days: leaveQuota.annualCarried,
          ),
          AnnualInfoItem(
            title: 'Additional Annual',
            days: leaveQuota.additionalLeaveDay,
          ),
        ],
      ),
    );
  }
}
