import 'package:timesheet/models/task_model.dart';

List<TaskModel> dummyTasks = [
  TaskModel(
    dayOfWeek: 'Monday',
    projectCode: '001',
    taskDetail: 'Flutter Self Learning',
    usageTimeHr: 8,
    usageTimeMinute: 30,
    issue: 'test',
    date: DateTime.now(),
  ),
  TaskModel(
    dayOfWeek: 'Monday',
    projectCode: '002',
    taskDetail: 'Drawing',
    usageTimeHr: 3,
    usageTimeMinute: 30,
    issue: 'test',
    date: DateTime.now(),
  ),
  TaskModel(
    dayOfWeek: 'Tuesday',
    projectCode: '003',
    taskDetail: 'Basketball',
    usageTimeHr: 2,
    usageTimeMinute: 0,
    issue: 'test',
    date: DateTime.now(),
  ),
  TaskModel(
    dayOfWeek: 'Wednesday',
    projectCode: '004',
    taskDetail: 'Flutter Self Learning',
    usageTimeHr: 2,
    usageTimeMinute: 30,
    issue: 'test',
    date: DateTime.now(),
  ),
];