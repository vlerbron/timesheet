import 'dart:io';
import 'package:flutter/material.dart';
import 'package:timesheet/models/employee_model.dart';

enum LeaveTypes { sick, annual, personal, special, withoutPay, holiday }

Map<LeaveTypes, Color> leaveTypesColor = {
  LeaveTypes.sick: const Color.fromRGBO(227, 141, 151, 1),
  LeaveTypes.annual: const Color.fromRGBO(135, 205, 204, 1),
  LeaveTypes.personal: const Color.fromRGBO(226, 212, 105, 1),
  LeaveTypes.special: const Color.fromRGBO(173, 173, 173, 1),
  LeaveTypes.withoutPay: const Color.fromRGBO(191, 132, 181, 1),
  LeaveTypes.holiday: const Color.fromRGBO(244, 211, 209, 1)
};

enum LeaveHours { allday, morning, afternoon }

String getLeaveHourDisplayText(LeaveHours leaveHours) {
  String leaveHourDisplayText;
  if (leaveHours == LeaveHours.allday) {
    leaveHourDisplayText = '${leaveHours.name[0].toUpperCase()}'
        '${leaveHours.name.substring(1, 3)} '
        '${leaveHours.name.substring(3)} ';
  } else {
    leaveHourDisplayText =
        leaveHours.name[0].toUpperCase() + leaveHours.name.substring(1);
  }

  return leaveHourDisplayText;
}

class Leave {
  Leave(
      {required this.startDate,
      required this.endDate,
      required this.leaveHour,
      required this.leaveType,
      required this.employee}) {
    totalLeaveDays = endDate.difference(startDate).inDays * 1.0;
  }

  DateTime startDate;
  DateTime endDate;
  LeaveTypes? leaveType;
  bool? isUrgent;
  LeaveHours? leaveHour;
  String? taskDetails;
  List<File>? attachment;
  double? totalLeaveDays;
  Employee employee;

  bool isCurrentDateAlldayLeave(DateTime currentDate) {
    return (leaveHour == LeaveHours.allday &&
        (startDate.isAtSameMomentAs(currentDate) ||
            startDate.isBefore(currentDate)) &&
        (endDate.isAtSameMomentAs(currentDate) ||
            endDate.isAfter(currentDate)));
  }

  bool isCurrentDateAfternoonLeave(DateTime currentDate) {
    return (leaveHour == LeaveHours.afternoon &&
        startDate.isAtSameMomentAs(currentDate));
  }

  bool isCurrentDateMorningLeave(DateTime currentDate) {
    return (leaveHour == LeaveHours.morning &&
        startDate.isAtSameMomentAs(currentDate));
  }
}