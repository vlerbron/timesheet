import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_model.dart';
import 'package:timesheet/presentation/widgets/timesheet/day_item.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/utils/const.dart';

class TasksOfDays extends ConsumerStatefulWidget {
  const TasksOfDays(this.selectedDate, {super.key});
  final DateTime selectedDate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TasksOfDays();
}

class _TasksOfDays extends ConsumerState<TasksOfDays> {
  @override
  Widget build(BuildContext context) {
    final TimesheetModel timesheetModel = ref.watch(timesheetProvider);
    final Map<String, Color> allDayOfWeek = timesheetModel.allDayOfWeekColorMap;
    final List<String> dayList = allDayOfWeek.keys.toList();
    final List<Color> colorList = allDayOfWeek.values.toList();
    DateTime selectedDate = widget.selectedDate;

    //for add new task
    final EventEmitter events = ref.watch(timesheetEventProvider);
    events.once(
        kTimesheetRebuild,
        (DateTime dateTime) => setState(() {
              selectedDate = dateTime;
            }));

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
