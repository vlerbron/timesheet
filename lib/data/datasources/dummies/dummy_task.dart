import 'package:timesheet/data/datasources/dummies/dummy_select_issue.dart';
import 'package:timesheet/models/task_model.dart';

List<TaskModel> dummyTasks = [
  TaskModel(
    dayOfWeek: 'Monday',
    taskDetail: 'Flutter Self Learning',
    duration: const Duration(hours: 8, minutes: 30),
    issue: dummySelectIssue[0],
    taskDate: DateTime.utc(2023, 10, 9),
  ),
  TaskModel(
    dayOfWeek: 'Monday',
    taskDetail: 'Drawing',
    duration: const Duration(hours: 3, minutes: 15),
    issue: dummySelectIssue[1],
    taskDate: DateTime.utc(2023, 10, 9),
  ),
  TaskModel(
    dayOfWeek: 'Tuesday',
    taskDetail: 'Basketball',
    duration: const Duration(hours: 2, minutes: 30),
    issue: dummySelectIssue[0],
    taskDate: DateTime.utc(2023, 10, 9),
  ),
  TaskModel(
    dayOfWeek: 'Wednesday',
    taskDetail: 'Reading',
    duration: const Duration(hours: 8, minutes: 0),
    issue: dummySelectIssue[5],
    taskDate: DateTime.utc(2023, 10, 9),
  ),
  TaskModel(
    dayOfWeek: 'Monday',
    taskDetail: 'Gaming',
    duration: const Duration(hours: 7, minutes: 30),
    issue: dummySelectIssue[3],
    taskDate: DateTime.utc(2023, 10, 5),
  ),
  TaskModel(
    dayOfWeek: 'Monday',
    taskDetail: 'Slam Dunk',
    duration: const Duration(hours: 5, minutes: 0),
    issue: dummySelectIssue[1],
    taskDate: DateTime.utc(2023, 9, 28),
  ),
  TaskModel(
    dayOfWeek: 'Tuesday',
    taskDetail: 'Lay Up',
    duration: const Duration(hours: 9, minutes: 30),
    issue: dummySelectIssue[3],
    taskDate: DateTime.utc(2023, 9, 29),
  ),
  TaskModel(
    dayOfWeek: 'Wednesday',
    taskDetail: 'Passing',
    duration: const Duration(hours: 8, minutes: 0),
    issue: dummySelectIssue[4],
    taskDate: DateTime.utc(2023, 10, 1),
  ),
];
