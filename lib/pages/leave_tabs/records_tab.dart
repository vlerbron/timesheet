import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/pages/leave_tabs/leave_record_item.dart';
import 'package:timesheet/pages/leave_tabs/new_leave_request.dart';
import 'package:timesheet/providers/leaves_provider.dart';
import 'package:timesheet/widgets/common/floating_add_button.dart';

class LeaveRecords extends ConsumerWidget {
  const LeaveRecords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var leaves = ref.watch(myLeaveProvider).toList();
    return Stack(alignment: Alignment.bottomRight, children: [
      ListView.builder(
          itemCount: leaves.length,
          itemBuilder: (context, index) {
            final leave = leaves[index];
            return Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
              child: LeaveRecordItem(leave: leave),
            );
          }),
      FloatingAddButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const NewLeaveRequest(
              isNew: true,
            ),
          ),
        );
      }),
    ]);
  }
}
