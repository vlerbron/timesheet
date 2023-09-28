import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/widgets/date_picker_timesheet.dart';
import 'package:timesheet/widgets/tabs.dart';

class TimesheetPage extends ConsumerStatefulWidget {
  const TimesheetPage({super.key});

  @override
  ConsumerState<TimesheetPage> createState() => _TimesheetPageState();
}

class _TimesheetPageState extends ConsumerState<TimesheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timesheet"),
      ),
      body: const DatePickerTimesheet(),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
