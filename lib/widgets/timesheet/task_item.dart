import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/utils/const.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.taskModel, {super.key});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${taskModel.projectCode}:${taskModel.taskDetail}",
              style: textTheme.titleMedium?.copyWith(color: kColorGreyText),
            ),
            const Spacer(),
            Text('${taskModel.usageTimeHr}.${taskModel.usageTimeMinute}h'),
          ],
        )
      ],
    );
  }
}
