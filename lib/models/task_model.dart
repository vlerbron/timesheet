class TaskModel {
  final String dayOfWeek;
  final String projectCode;
  final String taskDetail;
  final int usageTimeHr;
  final int usageTimeMinute;

  TaskModel(
      {required this.dayOfWeek,
      required this.projectCode,
      required this.taskDetail,
      required this.usageTimeHr,
      required this.usageTimeMinute});
}
