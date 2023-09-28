import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/providers/timesheet_provider.dart';

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
    _selectedDate = ref.read(timesheetProvider.notifier).state.selectedDate;
    String displayStr =
        '${startFormatter.format(findFirstDateOfTheWeek(_selectedDate))} - ${endFormatter.format(findLastDateOfTheWeek(_selectedDate))}';
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            color: const Color(0xff1E80B8),
            onPressed: () {
              setState(() {});
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor: MaterialStateProperty.all(
                  const Color(0xffF0F0F0)), // <-- Button color
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
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
            child: Text(displayStr),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            color: const Color(0xff1E80B8),
            onPressed: () {
              setState(() {});
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor: MaterialStateProperty.all(
                  const Color(0xffF0F0F0)), // <-- Button color
            ),
          ),
        ]);
  }
}
