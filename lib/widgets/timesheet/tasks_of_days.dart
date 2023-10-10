import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/timesheet_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/widgets/timesheet/day_item.dart';

class TasksOfDays extends ConsumerWidget {
  const TasksOfDays(this.selectedDate, {super.key});
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TimesheetModel timesheetModel = ref.watch(timesheetProvider);
    final Map<String, Color> allDayOfWeek = timesheetModel.allDayOfWeekColorMap;
    final List<String> dayList = allDayOfWeek.keys.toList();
    final List<Color> colorList = allDayOfWeek.values.toList();

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: kWidgetPadding),
        itemCount: dayList.length,
        itemBuilder: (ctx, index) => DayItem(
          dayList[index],
          colorList[index],
          selectedDate,
        ),
      ),
    );
  }
}
