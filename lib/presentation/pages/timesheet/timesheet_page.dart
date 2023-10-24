import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_model.dart';
import 'package:timesheet/presentation/widgets/timesheet/date_picker_timesheet.dart';
import 'package:timesheet/presentation/widgets/timesheet/tasks_of_days.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/widgets/common/long_submit_button.dart';
import 'package:timesheet/widgets/tabs.dart';

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
    TimesheetModel timesheetModel = ref.watch(timesheetProvider.provider);
    DateTime selectedDate = timesheetModel.selectedDate;
    List<TaskModel> tasks = ref.watch(taskListProvider.provider);

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
                          '${timesheetModel.timeRemaining.inHours}h',
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
          Visibility(
              visible: [TimesheetStatus.active, TimesheetStatus.reject]
                      .contains(timesheetModel.status) &&
                  tasks.isNotEmpty,
              child: LongSubmitButton(onTap: () {})),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
