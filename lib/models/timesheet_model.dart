class TimesheetModel {
  final DateTime selectedDate;
  final int timeRemainingHour;
  final int timeRemainingMinute;

  TimesheetModel(
      {required this.selectedDate,
      required this.timeRemainingHour,
      required this.timeRemainingMinute});
}
