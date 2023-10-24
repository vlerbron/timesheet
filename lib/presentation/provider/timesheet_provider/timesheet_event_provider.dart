import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_event_notifier.dart';

class TimesheetEventProvider {
  final StateNotifierProvider<TimesheetEventNotifier, EventEmitter> provider;
  TimesheetEventProvider(this.provider);
}