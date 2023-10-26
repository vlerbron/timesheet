import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimesheetEventProvider extends StateNotifier<EventEmitter> {
  TimesheetEventProvider() : super(EventEmitter());
}