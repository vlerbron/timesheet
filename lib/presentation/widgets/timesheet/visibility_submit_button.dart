import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/utils/date_time_mixin.dart';
import 'package:timesheet/presentation/widgets/common/button/long_submit_button.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/data/datasources/dummies/dummy_timesheet_state.dart';

class VisibilitySubmitButton extends ConsumerStatefulWidget {
  const VisibilitySubmitButton(this.selectedDate,
      {super.key, required this.onSubmitChanged});
  final DateTime selectedDate;
  final Function(DateTime) onSubmitChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _VisibilitySubmitButton();
  }
}

class _VisibilitySubmitButton extends ConsumerState<VisibilitySubmitButton>
    with DateTimeMixin {
  @override
  Widget build(BuildContext context) {
    TimesheetState timesheetState = ref.watch(timesheetProvider);
    DateTime firstDay = findFirstDateOfTheWeek(widget.selectedDate);
    TimesheetStateEntity timesheetStateEntity =
        timesheetState.timesheetStateMap[firstDay]!;
    EventEmitter eventEmitter = ref.watch(timesheetEventProvider);
    eventEmitter.once(TimesheetRebuildEvent.kSubmitButtonRebuild,
        (TimesheetStatus value) {
      if (mounted) {
        setState(() {
          timesheetStateEntity.status = value;
        });
      }
    });
    List<TaskEntity> weekTasks = ref
        .watch(taskListProvider.notifier)
        .getTaskListbyDateDuration(
            firstDay, findLastDateOfTheWeek(widget.selectedDate));
    return Visibility(
        visible: [TimesheetStatus.active, TimesheetStatus.reject]
                .contains(timesheetStateEntity.status) &&
            weekTasks.isNotEmpty,
        child: LongSubmitButton(onTap: () {
          setState(() {
            ref
                .read(timesheetProvider.notifier)
                .submitTimesheetState(firstDay, approvedTimesheetState);
          });
          widget.onSubmitChanged(widget.selectedDate);
        }));
  }
}
