import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/providers/leaves_provider.dart';
import 'package:timesheet/widgets/leave/leave_hour_row.dart';
import 'package:timesheet/providers/selected_date_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final formatter = DateFormat('EEE');

class LeaveListView extends ConsumerStatefulWidget {
  const LeaveListView({
    super.key,
    required this.itemScrollController,
  });
  @override
  ConsumerState<LeaveListView> createState() => _LeaveListViewState();

  final ItemScrollController itemScrollController;
}

class _LeaveListViewState extends ConsumerState<LeaveListView> {
  final initDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.itemScrollController.jumpTo(index: initDate.weekday - 1);
    });
  }

  @override
  void dispose() {
    ref.invalidate(selectedDateProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaveOfThisWeek = ref.watch(filteredLeaveProvider);
    final mondayOfTheweek = ref.watch(selectedDateProvider);
    return Expanded(
      child: ScrollablePositionedList.builder(
          itemScrollController: widget.itemScrollController,
          itemCount: 7,
          itemBuilder: (ctx, index) {
            final currentDate = mondayOfTheweek.add(Duration(days: index));
            return Container(
              margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 248, 253),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${currentDate.day} ${formatter.format(currentDate)}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: const Color.fromARGB(255, 30, 128, 184),
                            ),
                      ),
                    ],
                  ),
                  LeaveHourRow(
                    currentDate: currentDate,
                    leaveHours: LeaveHours.allday,
                    leaves: leaveOfThisWeek.where((leave) {
                      return (leave.leaveHour == LeaveHours.allday &&
                          (leave.startDate.isAtSameMomentAs(currentDate) ||
                              leave.startDate.isBefore(currentDate)) &&
                          (leave.endDate.isAtSameMomentAs(currentDate) ||
                              leave.endDate.isAfter(currentDate)));
                    }).toList(),
                  ),
                  LeaveHourRow(
                    currentDate: currentDate,
                    leaveHours: LeaveHours.afternoon,
                    leaves: leaveOfThisWeek
                        .where((leave) =>
                            (leave.leaveHour == LeaveHours.afternoon &&
                                leave.startDate.isAtSameMomentAs(currentDate)))
                        .toList(),
                  ),
                  LeaveHourRow(
                    currentDate: currentDate,
                    leaveHours: LeaveHours.morning,
                    leaves: leaveOfThisWeek
                        .where((leave) =>
                            (leave.leaveHour == LeaveHours.morning &&
                                leave.startDate.isAtSameMomentAs(currentDate)))
                        .toList(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
