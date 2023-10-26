import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';
import 'package:timesheet/presentation/widgets/leave/annual_info_item.dart';
import 'package:timesheet/presentation/widgets/leave/annual_leave_info.dart';
import 'package:timesheet/presentation/widgets/leave/annual_leave_info_banner.dart';
import 'package:timesheet/presentation/utils/const.dart';

class AnnualLeaveInfoBox extends StatelessWidget {
  const AnnualLeaveInfoBox({
    super.key,
    required this.leaveQuota,
  });

  final LeaveQuotaEntity leaveQuota;

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
