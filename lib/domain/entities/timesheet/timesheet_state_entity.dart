import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';

enum TimesheetStatus {
  active('Active'),
  submit('Waiting for Approved...'),
  reject('Rejected'),
  approve('Approved');

  const TimesheetStatus(this.text);
  final String text;
}

class TimesheetStateEntity {
  TimesheetStatus status;
  String detail;
  UserProfileEntity operator;
  Color bgColor, statusColor, userColor;
  DateTime txDateTime;

  TimesheetStateEntity(
      {this.status = TimesheetStatus.active,
      this.detail = '',
      this.operator = const UserProfileEntity(),
      this.bgColor = Colors.brown,
      this.statusColor = Colors.pink,
      this.userColor = Colors.black,
      required this.txDateTime,
      });

  setTimesheetStateEntity(TimesheetStateEntity state) {
    status = state.status;
    detail = state.detail;
    operator = state.operator;
    bgColor = state.bgColor;
    statusColor = state.statusColor;
    userColor = state.userColor;
    txDateTime = state.txDateTime;
  }
}
