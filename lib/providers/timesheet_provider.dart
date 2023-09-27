import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/timesheet_model.dart';

final timesheetProvider = StateProvider<TimesheetModel>(
  (ref) => TimesheetModel(
      endDateTime: DateTime.now(),
      startDateTime: DateTime.now(),
      timeRemainingHour: 0,
      timeRemainingMinute: 0),
);
