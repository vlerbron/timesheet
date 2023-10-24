import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_task.dart';
import 'package:timesheet/models/task_model.dart';

class TaskListNotifier extends StateNotifier<List<TaskModel>> {
  TaskListNotifier() : super(dummyTasks);

  List<TaskModel> getTaskListbyDayOfWeek(
      String dayOfWeek, DateTime startDate, DateTime endDate) {
    List<TaskModel> tasks = _getTaskListbyDateDuration(startDate, endDate);
    return tasks.where((task) => task.dayOfWeek == dayOfWeek).toList();
  }

  List<TaskModel> _getTaskListbyDateDuration(
      DateTime startDate, DateTime endDate) {
    return state
        .where((task) =>
            (task.taskDate.isAfter(startDate) ||
                task.taskDate.isAtSameMomentAs(startDate)) &&
            (task.taskDate.isBefore(endDate) ||
                task.taskDate.isAtSameMomentAs(endDate)))
        .toList();
  }

  void addTask(TaskModel task) {
    state.add(task);
  }

  void deleteTask(TaskModel task) {
    state.remove(task);
  }
}
