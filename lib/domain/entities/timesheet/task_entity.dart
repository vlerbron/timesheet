import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

final formatter = DateFormat('dd MMMM yyyy');

// ignore: must_be_immutable
class TaskEntity extends Equatable {
  final String id;
  String dayOfWeek;
  SelectIssueEntity issue;
  String taskDetail;
  DateTime taskDate;
  Duration duration;

  TaskEntity({
    required this.id,
    required this.dayOfWeek,
    required this.issue,
    required this.taskDetail,
    required this.taskDate,
    required this.duration,
  });

  String get formattedDate {
    return formatter.format(taskDate);
  }

  @override
  List<Object?> get props => [id];

  void setTask({
    required String dayOfWeek,
    required SelectIssueEntity issue,
    required String taskDetail,
    required DateTime taskDate,
    required Duration duration,
  }) {
    this.dayOfWeek = dayOfWeek;
    this.issue = issue;
    this.taskDetail = taskDetail;
    this.taskDate = taskDate;
    this.duration = duration;
  }

  void setTaskByObj({required TaskEntity task}) {
    dayOfWeek = task.dayOfWeek;
    issue = task.issue;
    taskDetail = task.taskDetail;
    taskDate = task.taskDate;
    duration = task.duration;
  }

  TaskEntity copyWith() {
    return TaskEntity(
        id: id,
        dayOfWeek: dayOfWeek,
        issue: issue,
        taskDetail: taskDetail,
        taskDate: taskDate,
        duration: duration);
  }
}
