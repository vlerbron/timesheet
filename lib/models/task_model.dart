import 'package:intl/intl.dart';

final formatter = DateFormat('dd MMMM yyyy');

class TaskModel {
  final String dayOfWeek;
  final String projectCode;
  final String issue;
  final String taskDetail;
  final DateTime date;
  final int usageTimeHr;
  final int usageTimeMinute;

  TaskModel({
    required this.dayOfWeek,
    required this.projectCode,
    required this.issue,
    required this.taskDetail,
    required this.date,
    required this.usageTimeHr,
    required this.usageTimeMinute,
  });

  String get formattedDate {
    return formatter.format(date);
  }
}