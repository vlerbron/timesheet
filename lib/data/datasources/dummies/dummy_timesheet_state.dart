import 'package:flutter/widgets.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';

TimesheetStateEntity rejectedTimesheetState = TimesheetStateEntity(
    detail: 'แก้ไข AAS ให้ลง [Ins-Broker-1] Theme development แทน',
    status: TimesheetStatus.reject,
    bgColor: const Color(0xFFFFE9E9),
    statusColor: const Color(0xFFF54551),
    txDateTime: DateTime.now());
TimesheetStateEntity approvedTimesheetState = TimesheetStateEntity(
    detail: '',
    bgColor: const Color(0xFFF3FFE5),
    status: TimesheetStatus.approve,
    txDateTime: DateTime.now(),
    statusColor: const Color(0xFF8BC34A));
TimesheetStateEntity submitTimesheetState = TimesheetStateEntity(
    detail: '',
    bgColor: const Color(0xFFF3FFE5),    
    status: TimesheetStatus.submit,
    txDateTime: DateTime.now());
