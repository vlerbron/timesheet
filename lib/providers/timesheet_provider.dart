import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/dummy_task.dart';
import 'package:timesheet/models/timesheet_model.dart';

final timesheetProvider = StateProvider<TimesheetModel>(
  (ref) => TimesheetModel(
      selectedDate: DateTime.now(),
      timeRemainingHour: 0,
      timeRemainingMinute: 0,
      taskList: dummyTasks),
);
