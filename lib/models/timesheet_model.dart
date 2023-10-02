import 'package:timesheet/models/task_model.dart';

class TimesheetModel {
  DateTime selectedDate;
  int timeRemainingHour;
  int timeRemainingMinute;
  final List<TaskModel> taskList;
  final List<String> allDayOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  TimesheetModel(
      {required this.selectedDate,
      required this.timeRemainingHour,
      required this.timeRemainingMinute,
      required this.taskList});
}
