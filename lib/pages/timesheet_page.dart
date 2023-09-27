import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/utils/main_drawer.dart';

final startFormatter = DateFormat('dd MMM');
final endFormatter = DateFormat('dd MMM yyyy');

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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('< '),
          Text(
            startFormatter.format(
                ref.read(timesheetProvider.notifier).state.startDateTime),
            textAlign: TextAlign.center,
          ),
          const Text(' - '),
          Text(
            endFormatter
                .format(ref.read(timesheetProvider.notifier).state.endDateTime),
            textAlign: TextAlign.center,
          ),
          const Text(' >'),
        ],
      ),
      drawer: const MainDrawer(selectedIndex: 2),
    );
  }
}
