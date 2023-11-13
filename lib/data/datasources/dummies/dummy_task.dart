import 'package:timesheet/data/datasources/dummies/dummy_select_issue.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:uuid/uuid.dart';

List<TaskEntity> dummyTasks = [
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Monday',
    taskDetail: 'Flutter Self Learning',
    duration: const Duration(hours: 8, minutes: 30),
    issue: dummySelectIssue[0],
    taskDate: DateTime.utc(2023, 11, 13),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Monday',
    taskDetail: 'Drawing',
    duration: const Duration(hours: 3, minutes: 15),
    issue: dummySelectIssue[1],
    taskDate: DateTime.utc(2023, 11, 13),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Tuesday',
    taskDetail: 'Basketball',
    duration: const Duration(hours: 2, minutes: 30),
    issue: dummySelectIssue[0],
    taskDate: DateTime.utc(2023, 11, 10),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Wednesday',
    taskDetail: 'Reading',
    duration: const Duration(hours: 8, minutes: 0),
    issue: dummySelectIssue[5],
    taskDate: DateTime.utc(2023, 11, 11),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Monday',
    taskDetail: 'Gaming',
    duration: const Duration(hours: 7, minutes: 30),
    issue: dummySelectIssue[3],
    taskDate: DateTime.utc(2023, 11, 5),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Monday',
    taskDetail: 'Slam Dunk',
    duration: const Duration(hours: 5, minutes: 0),
    issue: dummySelectIssue[1],
    taskDate: DateTime.utc(2023, 10, 28),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Tuesday',
    taskDetail: 'Lay Up',
    duration: const Duration(hours: 9, minutes: 30),
    issue: dummySelectIssue[3],
    taskDate: DateTime.utc(2023, 10, 29),
  ),
  TaskEntity(
    id: const Uuid().v4(),
    dayOfWeek: 'Wednesday',
    taskDetail: 'Passing',
    duration: const Duration(hours: 8, minutes: 0),
    issue: dummySelectIssue[4],
    taskDate: DateTime.utc(2023, 10, 1),
  ),
];
