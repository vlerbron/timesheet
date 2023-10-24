import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimesheetEventNotifier extends StateNotifier<EventEmitter> {
  TimesheetEventNotifier() : super(EventEmitter());
}