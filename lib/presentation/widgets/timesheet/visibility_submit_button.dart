import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/button/long_submit_button.dart';
import 'package:timesheet/provider_container.dart';

class VisibilitySubmitButton extends ConsumerStatefulWidget {
  final TimesheetStatus status;
  const VisibilitySubmitButton(this.status, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _VisibilitySubmitButton();
  }
}

class _VisibilitySubmitButton extends ConsumerState<VisibilitySubmitButton> {
  @override
  Widget build(BuildContext context) {
    TimesheetStatus status = widget.status;
    List<TaskEntity> tasks = ref.watch(taskListProvider);
    EventEmitter eventEmitter = ref.watch(timesheetEventProvider);
    eventEmitter.once(TimesheetRebuildEvent.kSubmitButtonRebuild,
        (TimesheetStatus value) {
      if (mounted) {
        setState(() {
          status = value;
        });
      }
    });
    return Visibility(
        visible:
            [TimesheetStatus.active, TimesheetStatus.reject].contains(status) &&
                tasks.isNotEmpty,
        child: LongSubmitButton(onTap: () {}));
  }
}
