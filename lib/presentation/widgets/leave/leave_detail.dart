import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/leave_detail_group.dart';

final leaveDetailDateFormatter = DateFormat('dd EEEE yyyy');

class LeaveDetail extends ConsumerWidget {
  const LeaveDetail({super.key, required this.currentDate});

  final DateTime currentDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveOfThisWeek = ref.watch(filteredLeaveProvider.provider);
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
