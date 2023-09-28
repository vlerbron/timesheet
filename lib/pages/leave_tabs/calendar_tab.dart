import 'package:flutter/material.dart';
import 'package:timesheet/widgets/custom_calendar_date_picker.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: CustomCalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                onDateChanged: (selectedDate) {})),
      ],
    );
  }
}
