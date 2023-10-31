import 'package:equatable/equatable.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';

class TimesheetState extends Equatable {
  final TimesheetEntity timesheetEntity;
  final Map<DateTime, TimesheetStateEntity> timesheetStateMap;

  const TimesheetState({
    required this.timesheetEntity,
    required this.timesheetStateMap,
  });

  @override
  List<Object> get props => [timesheetEntity, timesheetStateMap];
}
