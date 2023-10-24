import 'package:intl/intl.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

final formatter = DateFormat('dd MMMM yyyy');

class TaskEntity {
  final String dayOfWeek;
  final SelectIssueEntity issue;
  final String taskDetail;
  final DateTime taskDate;
  final Duration duration;

  TaskEntity({
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
