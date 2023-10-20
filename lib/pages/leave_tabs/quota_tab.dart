import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/pages/leave_tabs/additional_annual_leave.dart';
import 'package:timesheet/pages/leave_tabs/annual_leave_info_box.dart';
import 'package:timesheet/pages/leave_tabs/annual_statistics.dart';
import 'package:timesheet/pages/leave_tabs/leave_quota_header.dart';
import 'package:timesheet/providers/leave_quota_provider.dart';

class QuotaTab extends ConsumerStatefulWidget {
  const QuotaTab({super.key});

  @override
  ConsumerState<QuotaTab> createState() => _QuotaTabState();
}

class _QuotaTabState extends ConsumerState<QuotaTab> {
  @override
  Widget build(BuildContext context) {
    final leaveQuota = ref.watch(currentLeaveQuotaProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const LeaveQuotaHeader(
            title: 'Annual leave information',
          ),
          const SizedBox(
            height: 5,
          ),
          AnnualLeaveInfoBox(leaveQuota: leaveQuota),
          const SizedBox(
            height: 10,
          ),
          const LeaveQuotaHeader(
            title: 'Annual Statistics',
          ),
          const AnnualStatistics(),
          const LeaveQuotaHeader(
            title: 'Additional Annual Leave',
          ),
          AdditionalAnnualLeaveBox(
            additionalAnnualLeaves: leaveQuota.additionalAnnualLeaves,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
