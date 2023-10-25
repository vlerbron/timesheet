// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';

enum TimesheetStatus {
  active,
  submit,
  reject,
  approve,
}

class TimesheetState extends Equatable {
  final TimesheetStatus timesheetStatus;
  final TimesheetEntity timesheetEntity;

  const TimesheetState({
    required this.timesheetStatus,
    required this.timesheetEntity,
  });


  @override
  List<Object> get props => [timesheetStatus, timesheetEntity];
}
