import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_model.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_event_notifier.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_notifier.dart';

final timesheetProvider =
    StateNotifierProvider<TimesheetNotifier, TimesheetModel>((ref) {
  return TimesheetNotifier();
});


final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<TaskModel>>((ref) {
  return TaskListNotifier();
});

final timesheetEventProvider =
    StateNotifierProvider<TimesheetEventNotifier, EventEmitter>((ref) {
  return TimesheetEventNotifier();
});
