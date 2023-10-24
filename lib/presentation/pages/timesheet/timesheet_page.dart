import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/widgets/timesheet/date_picker_timesheet.dart';
import 'package:timesheet/presentation/widgets/timesheet/tasks_of_days.dart';
import 'package:timesheet/presentation/widgets/timesheet/visibility_submit_button.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class TimesheetPage extends ConsumerStatefulWidget {
  const TimesheetPage({super.key});

  @override
  ConsumerState<TimesheetPage> createState() => _TimesheetPageState();
}

class _TimesheetPageState extends ConsumerState<TimesheetPage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = colorScheme.primary;
    final Color secondaryColor = colorScheme.secondary;
    TimesheetState state = ref.watch(timesheetProvider.provider);
    TimesheetEntity timesheetEntity = state.timesheetEntity;
    TimesheetStatus status = state.timesheetStatus;
    DateTime selectedDate = timesheetEntity.selectedDate;

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
                selectedDate = dateTime;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            color: secondaryColor,
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
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
          TasksOfDays(selectedDate),
          VisibilitySubmitButton(status),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
