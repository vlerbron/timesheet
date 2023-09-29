import 'package:timesheet/models/task.dart';

class TimesheetModel {
  DateTime selectedDate;
  int timeRemainingHour;
  int timeRemainingMinute;
  final Map<String, List<Task>> taskMap;

  TimesheetModel(
      {required this.selectedDate,
      required this.timeRemainingHour,
      required this.timeRemainingMinute,
      required this.taskMap});
}
