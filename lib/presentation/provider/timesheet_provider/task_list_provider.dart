import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';

class TaskListProvider {
  final StateNotifierProvider<TaskListNotifier, List<TaskEntity>> provider;
  TaskListProvider(this.provider);
}