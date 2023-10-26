import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/additional_annual_leave.dart';
import 'package:timesheet/presentation/widgets/leave/annual_leave_info_box.dart';
import 'package:timesheet/presentation/widgets/leave/annual_statistics.dart';
import 'package:timesheet/presentation/widgets/leave/leave_quota_header.dart';

class QuotaTab extends ConsumerStatefulWidget {
  const QuotaTab({super.key});

  @override
  ConsumerState<QuotaTab> createState() => _QuotaTabState();
}

class _QuotaTabState extends ConsumerState<QuotaTab> {
  @override
  void dispose() {
    ref.invalidate(leaveIndexProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaveQuota = ref.watch(currentLeaveQuotaProvider.provider);

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
