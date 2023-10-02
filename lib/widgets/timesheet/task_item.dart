import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.taskModel, {super.key});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("${taskModel.projectCode}:${taskModel.taskDetail}"),
            const Spacer(),
            Text('${taskModel.usageTimeHr}:${taskModel.usageTimeMinute}h'),
          ],
        )
      ],
    );
  }
}
