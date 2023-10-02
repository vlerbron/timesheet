class TimesheetModel {
  DateTime selectedDate;
  int timeRemainingHour;
  int timeRemainingMinute;
  final List<String> allDayOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  TimesheetModel({
    required this.selectedDate,
    required this.timeRemainingHour,
    required this.timeRemainingMinute,
  });
}
