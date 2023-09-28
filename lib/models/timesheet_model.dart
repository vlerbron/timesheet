class TimesheetModel {
  DateTime selectedDate;
  int timeRemainingHour;
  int timeRemainingMinute;

  TimesheetModel(
      {required this.selectedDate,
      required this.timeRemainingHour,
      required this.timeRemainingMinute});
}
