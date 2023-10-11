import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/dummy_task.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/models/timesheet_model.dart';

class TimesheetNotifier extends StateNotifier<TimesheetModel> {
  TimesheetNotifier()
      : super(TimesheetModel(
          selectedDate: DateTime.now().copyWith(
              hour: 0,
              minute: 0,
              second: 0,
              millisecond: 0,
              microsecond: 0,
              isUtc: true),
          timeRemainingHour: 0,
          timeRemainingMinute: 0,
        ));

  void setSelectedDate(
      {bool isBefore = true, required bool is7Days, dynamic dateTime}) {
    if (is7Days) {
      state.selectedDate = isBefore
          ? state.selectedDate.subtract(const Duration(days: 7))
          : state.selectedDate.add(const Duration(days: 7));
    } else {
      DateTime d = dateTime;
      state.selectedDate = d.copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
          isUtc: true);
    }
    state.isShowTasksMap
        .forEach((key, value) => state.isShowTasksMap[key] = false);
  }

  void setIsShowTasks(String dayOfWeek, bool isShowTasks) {
    state.isShowTasksMap[dayOfWeek] = isShowTasks;
  }
}

final timesheetProvider =
    StateNotifierProvider<TimesheetNotifier, TimesheetModel>((ref) {
  return TimesheetNotifier();
});

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
            (task.date.isAfter(startDate) ||
                task.date.isAtSameMomentAs(startDate)) &&
            (task.date.isBefore(endDate) ||
                task.date.isAtSameMomentAs(endDate)))
        .toList();
  }

  void addTask(TaskModel task) {
    state.add(task);
  }
}

final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<TaskModel>>((ref) {
  return TaskListNotifier();
});

class TimesheetEventNotifier extends StateNotifier<EventEmitter> {
  TimesheetEventNotifier() : super(EventEmitter());
}

final timesheetEventProvider =
    StateNotifierProvider<TimesheetEventNotifier, EventEmitter>((ref) {
  return TimesheetEventNotifier();
});
