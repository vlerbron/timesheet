import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/timesheet/custom_date_picker_popup.dart';

final startFormatter = DateFormat('dd MMM');
final endFormatter = DateFormat('dd MMM yyyy');

class DatePickerTimesheet extends ConsumerStatefulWidget {
  const DatePickerTimesheet({super.key});

  @override
  ConsumerState<DatePickerTimesheet> createState() =>
      _DatePickerTimesheetState();
}

class _DatePickerTimesheetState extends ConsumerState<DatePickerTimesheet> {
  late DateTime _selectedDate;

  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = colorScheme.primary;
    final Color secondaryColor = colorScheme.secondary;

    _selectedDate = ref.read(timesheetProvider.notifier).state.selectedDate;

    String displayStr =
        '${startFormatter.format(findFirstDateOfTheWeek(_selectedDate))} - ${endFormatter.format(findLastDateOfTheWeek(_selectedDate))}';

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            color: primaryColor,
            onPressed: () {
              setState(() =>
                  ref.read(timesheetProvider.notifier).state.selectedDate = ref
                      .read(timesheetProvider.notifier)
                      .state
                      .selectedDate
                      .subtract(const Duration(days: 7)));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStateProperty.all(secondaryColor), // <-- Button color
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              DateTime? newDate = await showCustomDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2000),
                lastDate: findLastDateOfTheWeek(DateTime.now()),
              );
              if (newDate != null) {
                setState(() => ref
                    .read(timesheetProvider.notifier)
                    .state
                    .selectedDate = newDate);
              }
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
            ),
            child: Text(
              displayStr,
              style: textTheme.bodyLarge?.copyWith(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            color: primaryColor,
            onPressed: () {
              DateTime nextWeekDay = ref
                  .read(timesheetProvider.notifier)
                  .state
                  .selectedDate
                  .add(const Duration(days: 7));
              if (nextWeekDay
                      .compareTo(findLastDateOfTheWeek(DateTime.now())) <=
                  0) {
                setState(() => ref
                    .read(timesheetProvider.notifier)
                    .state
                    .selectedDate = nextWeekDay);
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStateProperty.all(secondaryColor), // <-- Button color
            ),
          ),
        ]);
  }
}
