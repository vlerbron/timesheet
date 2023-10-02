import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/pages/leave_tabs/leave_detail_group.dart';
import 'package:timesheet/providers/leaves_provider.dart';

final leaveDetailDateFormatter = DateFormat('dd EEEE yyyy');

class LeaveDetail extends ConsumerWidget {
  const LeaveDetail({super.key, required this.currentDate});

  final DateTime currentDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveOfThisWeek = ref.watch(filteredLeaveProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 246, 248),
      appBar: AppBar(
        centerTitle: true,
        title: Text(leaveDetailDateFormatter.format(currentDate)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          LeaveDetailGroup(
            leaveHour: LeaveHours.allday,
            leaves: leaveOfThisWeek
                .where((leave) => leave.isCurrentDateAlldayLeave(currentDate))
                .toList(),
          ),
          LeaveDetailGroup(
            leaveHour: LeaveHours.afternoon,
            leaves: leaveOfThisWeek
                .where(
                    (leave) => leave.isCurrentDateAfternoonLeave(currentDate))
                .toList(),
          ),
          LeaveDetailGroup(
            leaveHour: LeaveHours.morning,
            leaves: leaveOfThisWeek
                .where((leave) => leave.isCurrentDateMorningLeave(currentDate))
                .toList(),
          )
        ]),
      ),
    );
  }
}
