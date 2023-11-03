import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/utils/date_time_mixin.dart';
import 'package:timesheet/presentation/widgets/timesheet/date_picker_timesheet.dart';
import 'package:timesheet/presentation/widgets/timesheet/status_notification.dart';
import 'package:timesheet/presentation/widgets/timesheet/tasks_of_days.dart';
import 'package:timesheet/presentation/widgets/timesheet/visibility_submit_button.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class TimesheetPage extends ConsumerStatefulWidget {
  const TimesheetPage({super.key});

  @override
  ConsumerState<TimesheetPage> createState() => _TimesheetPageState();
}

class _TimesheetPageState extends ConsumerState<TimesheetPage>
    with DateTimeMixin {
  late DateTime _selectedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EventEmitter events = ref.watch(timesheetEventProvider);
    events.on(TimesheetRebuildEvent.kTimesheetRebuild, (DateTime dateTime) {
      if (mounted) {
        setState(() {
          _selectedDate = dateTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = colorScheme.primary;
    final Color secondaryColor = colorScheme.secondary;
    TimesheetState state = ref.watch(timesheetProvider);
    TimesheetEntity timesheetEntity = state.timesheetEntity;
    Map<DateTime, TimesheetStateEntity> timesheetStateMap =
        state.timesheetStateMap;
    DateTime firstDay = findFirstDateOfTheWeek(timesheetEntity.selectedDate);
    TimesheetStateEntity? stateEntity = timesheetStateMap[firstDay];
    if (stateEntity == null) {
      TimesheetStateEntity timesheetStateEntity = TimesheetStateEntity(
          status: TimesheetStatus.active, txDateTime: DateTime.now());
      timesheetStateMap.addAll({firstDay: timesheetStateEntity});
      stateEntity = timesheetStateEntity;
    }
    _selectedDate = timesheetEntity.selectedDate;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Timesheet"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DatePickerTimesheet(
            onSelectedDateChanged: (dateTime) {
              setState(() {
                _selectedDate = dateTime;
              });
            },
          ),
          const SizedBox(height: kWidgetLineSpace),
          Container(
            color: secondaryColor,
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kWidgetPadding, right: kWidgetPadding),
                    child: Row(
                      children: [
                        Text(
                          'Time remaining',
                          style: textTheme.bodyLarge?.copyWith(),
                        ),
                        const Spacer(),
                        Text(
                          '${timesheetEntity.timeRemaining.inHours}h',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          if (stateEntity.status != TimesheetStatus.active)
            StatusNotification(_selectedDate),
          TasksOfDays(_selectedDate),
          VisibilitySubmitButton(
            _selectedDate,
          ),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
