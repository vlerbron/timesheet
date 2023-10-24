import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/utils/date_time_mixin.dart';
import 'package:timesheet/widgets/common/alert_dialog_two_button.dart';

class TaskItem extends ConsumerWidget with DateTimeMixin {
  const TaskItem(this.taskModel, {super.key});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String hour = taskModel.duration.inHours.toString();
    final String minute = twoDigits(taskModel.duration.inMinutes.remainder(60));
    final AlertDialogTwoButton dialog = AlertDialogTwoButton(onRightTap: () {
      final TaskListNotifier taskListNotifier =
          ref.read(taskListProvider.notifier);
      taskListNotifier.deleteTask(taskModel);
      final EventEmitter events = ref.watch(timesheetEventProvider);
      events.emit(kTimesheetRebuild, taskModel.taskDate);
      Navigator.of(context).pop();
    });
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
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () => dialog.showAlertDialog(context),
              child: Text(
                String.fromCharCode(CupertinoIcons.minus_circle.codePoint),
                style: TextStyle(
                  inherit: false,
                  color: Colors.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: CupertinoIcons.circle.fontFamily,
                  package: CupertinoIcons.circle.fontPackage,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
