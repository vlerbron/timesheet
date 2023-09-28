import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/pages/new_task.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/widgets/tabs.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                  endFormatter.format(
                      ref.read(timesheetProvider.notifier).state.endDateTime),
                  textAlign: TextAlign.center,
                ),
                const Text(' >'),
              ],
            ),
            SizedBox(height: 15),
            OutlinedButton.icon(
              onPressed: () {
                //NewTask();
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => NewTask()));
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('New task'),
            ),
            //TextButton(onPressed: () {}, child: NewPage()),
          ],
        ),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 1),
    );
  }
}
