import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final startFormatter = DateFormat('dd MMM');
final endFormatter = DateFormat('dd MMM yyyy');

class DatePickerTimesheet extends StatefulWidget {
  const DatePickerTimesheet(
      {super.key, this.restorationId, required this.selectedDate});

  final String? restorationId;
  final DateTime selectedDate;

  @override
  State<DatePickerTimesheet> createState() => _DatePickerTimesheetState();
}

class _DatePickerTimesheetState extends State<DatePickerTimesheet>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  @override
  Widget build(BuildContext context) {
    String displayStr =
        '${startFormatter.format(findFirstDateOfTheWeek(widget.selectedDate))} - ${endFormatter.format(findLastDateOfTheWeek(widget.selectedDate))}';
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
            onPressed: () {
              _restorableDatePickerRouteFuture.present();
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
