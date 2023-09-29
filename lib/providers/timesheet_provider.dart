import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task.dart';
import 'package:timesheet/models/timesheet_model.dart';

final Map<String, List<Task>> taskMap = {
  'Monday': [],
  'Tuesday': [],
  'Wednesday': [],
  'Thursday': [],
  'Friday': [],
  'Saturday': [],
  'Sunday': [],
};

final timesheetProvider = StateProvider<TimesheetModel>(
  (ref) => TimesheetModel(
      selectedDate: DateTime.now(),
      timeRemainingHour: 0,
      timeRemainingMinute: 0,
      taskMap: taskMap),
);
