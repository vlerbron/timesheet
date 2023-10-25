import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_notifier.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';

class TaskProvider {
  final StateNotifierProvider<TaskNotifier, TaskState> provider;
  TaskProvider(this.provider);
}