import 'package:intl/intl.dart';
import 'package:timesheet/models/select_issue_model.dart';

final formatter = DateFormat('dd MMMM yyyy');

class TaskModel {
  final String dayOfWeek;
  final SelectIssueModel issue;
  final String taskDetail;
  final DateTime taskDate;
  final Duration duration;

  TaskModel({
    required this.dayOfWeek,
    required this.issue,
    required this.taskDetail,
    required this.taskDate,
    required this.duration,
  });

  String get formattedDate {
    return formatter.format(taskDate);
  }
}
