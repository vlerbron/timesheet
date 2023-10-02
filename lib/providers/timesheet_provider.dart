import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/dummy_task.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/models/timesheet_model.dart';

final timesheetProvider = StateProvider<TimesheetModel>(
  (ref) => TimesheetModel(
    selectedDate: DateTime.now(),
    timeRemainingHour: 0,
    timeRemainingMinute: 0,
  ),
);

class TaskListNotifier extends StateNotifier<List<TaskModel>> {
  TaskListNotifier() : super(dummyTasks);

  List<TaskModel> getTaskListbyDayOfWeek(String dayOfWeek) {
    return state.where((task) => task.dayOfWeek == dayOfWeek).toList();
  }
}

final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<TaskModel>>((ref) {
  return TaskListNotifier();
});
