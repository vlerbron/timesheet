import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_task.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';

class TaskListProvider extends StateNotifier<List<TaskEntity>> {
  TaskListProvider() : super(dummyTasks);

  List<TaskEntity> getTaskListbyDayOfWeek(
      String dayOfWeek, DateTime startDate, DateTime endDate) {
    List<TaskEntity> tasks = getTaskListbyDateDuration(startDate, endDate);
    return tasks.where((task) => task.dayOfWeek == dayOfWeek).toList();
  }

  List<TaskEntity> getTaskListbyDateDuration(
      DateTime startDate, DateTime endDate) {
    return state
        .where((task) =>
            (task.taskDate.isAfter(startDate) ||
                task.taskDate.isAtSameMomentAs(startDate)) &&
            (task.taskDate.isBefore(endDate) ||
                task.taskDate.isAtSameMomentAs(endDate)))
        .toList();
  }

  void addTask(TaskEntity task) {
    state.add(task);
  }

  void editTask(TaskEntity task){
    TaskEntity taskEntity = state.firstWhere((element) => element == task);
    taskEntity.setTaskByObj(task: task);
  }

  void deleteTask(TaskEntity task) {
    state.remove(task);
  }
}
