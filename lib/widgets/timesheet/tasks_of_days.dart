import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/timesheet/day_item.dart';

class TasksOfDays extends ConsumerWidget {
  const TasksOfDays({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> dayList =
        ref.read(timesheetProvider.notifier).state.allDayOfWeek;

    return Expanded(
      child: ListView.builder(
        itemCount: dayList.length,
        itemBuilder: (ctx, index) => DayItem(dayList[index]),
      ),
    );
  }
}
