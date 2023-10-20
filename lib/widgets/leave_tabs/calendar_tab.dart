import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/widgets/leave_tabs/new_leave_request.dart';
import 'package:timesheet/providers/selected_date_provider.dart';
import 'package:timesheet/widgets/common/floating_add_button.dart';
import 'package:timesheet/widgets/custom_calendar_date_picker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timesheet/widgets/leave/leave_listview.dart';

class CalendarTab extends ConsumerStatefulWidget {
  const CalendarTab({super.key});

  @override
  ConsumerState<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends ConsumerState<CalendarTab> {
  late DateTime sundayOfTheweek;
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomCalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 5),
              lastDate: DateTime(DateTime.now().year + 5),
              onDateChanged: _selectDate,
            ),
          ),
          LeaveListView(
            itemScrollController: itemScrollController,
          )
        ],
      ),
      FloatingAddButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => const NewLeaveRequest(
                      isNew: true,
                    )));
      }),
    ]);
  }

  void _selectDate(selectedDate) {
    ref.read(selectedDateProvider.notifier).onSelectDate(selectedDate);
    itemScrollController.jumpTo(
      index: selectedDate.weekday - 1,
    );
  }
}
