import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/timesheet/task_item.dart';

class DayItem extends ConsumerWidget {
  const DayItem(this.dayOfWeek, {super.key});
  final String dayOfWeek;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TaskModel> taskList =
        ref.read(taskListProvider.notifier).getTaskListbyDayOfWeek(dayOfWeek);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Card(
          color: colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      dayOfWeek,
                      style:
                          textTheme.titleLarge?.copyWith(color: Colors.black),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      color: colorScheme.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          itemCount: taskList.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) => TaskItem(taskList[index]),
        ),
      ],
    );
  }
}
