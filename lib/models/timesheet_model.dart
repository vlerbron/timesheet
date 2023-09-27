class TimesheetModel {
  final DateTime startDateTime;
  final DateTime endDateTime;
  final int timeRemainingHour;
  final int timeRemainingMinute;

  TimesheetModel(
      {required this.startDateTime,
      required this.endDateTime,
      required this.timeRemainingHour,
      required this.timeRemainingMinute});
}
