import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.taskModel, {super.key});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.dayOfWeek,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(taskModel.projectCode + taskModel.taskDetail),
                const Spacer(),
                Text('${taskModel.usageTimeHr}:${taskModel.usageTimeMinute}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
