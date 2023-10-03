import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/timesheet/task_item.dart';

class DayItem extends ConsumerStatefulWidget {
  const DayItem(this.dayOfWeek, {super.key});
  final String dayOfWeek;

  @override
  ConsumerState<DayItem> createState() => _DayItemState();
}

class _DayItemState extends ConsumerState<DayItem> {
  bool isShowTask = false;
  @override
  Widget build(BuildContext context) {
    final List<TaskModel> taskList = ref
        .read(taskListProvider.notifier)
        .getTaskListbyDayOfWeek(widget.dayOfWeek);
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
                      widget.dayOfWeek,
                      style:
                          textTheme.titleLarge?.copyWith(color: Colors.black),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: (isShowTask)
                          ? const Icon(Icons.arrow_drop_up)
                          : const Icon(Icons.arrow_drop_down),
                      color: colorScheme.primary,
                      onPressed: () {
                        setState(() {
                          isShowTask = !isShowTask;
                          print('isShowTask: $isShowTask');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isShowTask,
          child: Card(
            color: colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemCount: taskList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) => TaskItem(taskList[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
