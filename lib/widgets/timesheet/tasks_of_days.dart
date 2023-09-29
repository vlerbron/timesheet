import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/providers/timesheet_provider.dart';

class TasksOfDays extends ConsumerWidget {
  const TasksOfDays({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map taskMap = ref.read(timesheetProvider.notifier).state.taskMap;
    return Column(
      children: [
        for (var task in taskMap.entries)
          ListTile(
            title: Text(task.key),
          )
      ],
    );
  }
}
