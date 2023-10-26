import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/presentation/widgets/common/button/floating_add_button.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/leave_record_item.dart';

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
        Navigator.of(context).pushNamed(Routes.newLeavePage);
      }),
    ]);
  }
}
