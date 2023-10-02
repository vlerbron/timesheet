import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/tabs.dart';
import 'package:timesheet/widgets/timesheet/date_picker_timesheet.dart';
import 'package:timesheet/widgets/timesheet/tasks_of_days.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Timesheet"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const DatePickerTimesheet(),
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
                          '${ref.read(timesheetProvider.notifier).state.timeRemainingHour}h',
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
          const TasksOfDays(),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
