import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_notifier.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';

class TimesheetProvider {
  final StateNotifierProvider<TimesheetNotifier, TimesheetState> provider;
  TimesheetProvider(this.provider);
}
