import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';

class TaskListProvider {
  final StateNotifierProvider<TaskListNotifier, List<TaskModel>> provider;
  TaskListProvider(this.provider);
}