import 'package:flutter/material.dart';

import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/pages/leave_tabs/leave_detail_item.dart';

class LeaveDetailGroup extends StatelessWidget {
  const LeaveDetailGroup(
      {super.key, required this.leaveHour, required this.leaves});
  final LeaveHours leaveHour;
  final List<Leave> leaves;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: leaves.isNotEmpty,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getLeaveHourDisplayText(leaveHour),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            for (Leave leave in leaves) LeaveDetailItem(leave: leave)
          ],
        ),
      ),
    );
  }
}
