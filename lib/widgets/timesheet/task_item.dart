import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/utils/date_time_mixin.dart';

class TaskItem extends StatelessWidget with DateTimeMixin {
  const TaskItem(this.taskModel, {super.key});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String hour = taskModel.duration.inHours.toString();
    final String minute = twoDigits(taskModel.duration.inMinutes.remainder(60));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${taskModel.issue.clientCode}-${taskModel.issue.projectCode}-${taskModel.issue.title}",
              style: textTheme.titleMedium?.copyWith(color: kColorGreyText),
            ),
            const Spacer(),
            Text('$hour.${minute}h'),
          ],
        )
      ],
    );
  }
}
