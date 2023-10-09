import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/models/timesheet_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/utils/date_time_mixin.dart';
import 'package:timesheet/widgets/timesheet/custom_date_picker_popup.dart';

final startFormatter = DateFormat('dd MMM');
final endFormatter = DateFormat('dd MMM yyyy');

typedef SelectedDateCallBack = void Function(DateTime selectedDate);

class DatePickerTimesheet extends ConsumerStatefulWidget {
  const DatePickerTimesheet({super.key, required this.onSelectedDateChanged});
  final SelectedDateCallBack onSelectedDateChanged;

  @override
  ConsumerState<DatePickerTimesheet> createState() =>
      _DatePickerTimesheetState();
}

class _DatePickerTimesheetState extends ConsumerState<DatePickerTimesheet>
    with DateTimeMixin {
  late DateTime selectedDate;

  void setSelectedDate(DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
      widget.onSelectedDateChanged(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = colorScheme.primary;
    final Color secondaryColor = colorScheme.secondary;
    final TimesheetModel timesheetModel = ref.watch(timesheetProvider);
    final TimesheetNotifier timesheetNotifier =
        ref.read(timesheetProvider.notifier);
    selectedDate = timesheetModel.selectedDate;

    String displayStr =
        '${startFormatter.format(findFirstDateOfTheWeek(selectedDate))} - ${endFormatter.format(findLastDateOfTheWeek(selectedDate))}';

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            color: primaryColor,
            onPressed: () {
              timesheetNotifier.setSelectedDate();
              setSelectedDate(timesheetModel.selectedDate);
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
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: findLastDateOfTheWeek(DateTime.now()),
              );
              if (newDate != null) {
                timesheetNotifier.setSelectedDate(
                    dateTime: newDate, is7Days: false);
                setSelectedDate(newDate);
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
              DateTime nextWeekDay =
                  timesheetModel.selectedDate.add(const Duration(days: 7));
              if (nextWeekDay
                      .compareTo(findLastDateOfTheWeek(DateTime.now())) <=
                  0) {
                timesheetNotifier.setSelectedDate(isBefore: false);
                setSelectedDate(timesheetModel.selectedDate);
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
