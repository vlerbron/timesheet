import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_model.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_notifier.dart';

class TimesheetProvider {
  final StateNotifierProvider<TimesheetNotifier, TimesheetModel> provider;
  TimesheetProvider(this.provider);
}
