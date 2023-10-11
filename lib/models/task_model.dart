import 'package:intl/intl.dart';

final formatter = DateFormat('dd MMMM yyyy');

class TaskModel {
  final String dayOfWeek;
  final String projectCode;
  final String issueNo;
  final String taskDetail;
  final DateTime date;
  final Duration duration;

  TaskModel({
    required this.dayOfWeek,
    required this.projectCode,
    required this.issueNo,
    required this.taskDetail,
    required this.date,
    required this.duration,
  });

  String get formattedDate {
    return formatter.format(date);
  }
}
