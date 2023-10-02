import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/timesheet/task_item.dart';

class TasksOfDays extends ConsumerWidget {
  const TasksOfDays({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> taskList =
        ref.read(timesheetProvider.notifier).state.taskList;

    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (ctx, index) => TaskItem(taskList[index]),
      ),
    );
  }
}
