import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';
import 'package:timesheet/presentation/widgets/common/button/alert_dialog_two_button.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/utils/date_time_mixin.dart';

class TaskItem extends ConsumerWidget with DateTimeMixin {
  const TaskItem(this.taskEntity, {super.key});
  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String hour = taskEntity.duration.inHours.toString();
    final String minute =
        twoDigits(taskEntity.duration.inMinutes.remainder(60));
    final AlertDialogTwoButton dialog = AlertDialogTwoButton(onRightTap: () {
      final TaskListNotifier taskListNotifier =
          ref.read(taskListProvider.provider.notifier);
      taskListNotifier.deleteTask(taskEntity);
      final EventEmitter events = ref.watch(timesheetEventProvider.provider);
      events.emit(TimesheetRebuildEvent.kTaskListRebuild, taskEntity.taskDate);
      events.emit(TimesheetRebuildEvent.kSubmitButtonRebuild,
          ref.watch(timesheetProvider.provider).timesheetStatus);
      Navigator.of(context).pop();
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${taskEntity.issue.clientCode}-${taskEntity.issue.projectCode}-${taskEntity.issue.title}",
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
