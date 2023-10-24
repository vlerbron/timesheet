import 'dart:io';
import 'package:flutter/material.dart';
import 'package:timesheet/models/employee_model.dart';
import 'package:timesheet/presentation/utils/const.dart';

enum LeaveTypes { sick, annual, personal, special, withoutPay, holiday }

Map<LeaveTypes, Color> leaveTypesColor = {
  LeaveTypes.sick: const Color.fromRGBO(227, 141, 151, 1),
  LeaveTypes.annual: const Color.fromRGBO(135, 205, 204, 1),
  LeaveTypes.personal: const Color.fromRGBO(226, 212, 105, 1),
  LeaveTypes.special: const Color.fromRGBO(173, 173, 173, 1),
  LeaveTypes.withoutPay: const Color.fromRGBO(191, 132, 181, 1),
  LeaveTypes.holiday: const Color.fromRGBO(244, 211, 209, 1)
};

Map<LeaveActions, Color> leaveActionsColor = {
  LeaveActions.cancel: const Color.fromRGBO(128, 128, 128, 1),
  LeaveActions.request: const Color.fromRGBO(2, 194, 242, 1),
};

Map<LeaveActions, IconData> leaveActionsIcon = {
  LeaveActions.cancel: Icons.remove_circle_outline,
  LeaveActions.request: Icons.arrow_outward_rounded,
};
Map<LeaveStatus, Color> leaveStatusColor = {
  LeaveStatus.approved: kColorLightGreen,
  LeaveStatus.rejected: const Color.fromRGBO(245, 69, 81, 1),
  LeaveStatus.waitforapproval: const Color.fromRGBO(255, 184, 0, 1),
  LeaveStatus.waitforpreapproval: const Color.fromRGBO(255, 184, 0, 1),
};

Map<LeaveStatus, IconData> leaveStatusIcon = {
  LeaveStatus.approved: Icons.check_circle_rounded,
  LeaveStatus.rejected: Icons.cancel_rounded,
  LeaveStatus.waitforapproval: Icons.access_time_rounded,
  LeaveStatus.waitforpreapproval: Icons.access_time_rounded,
};

enum LeaveHours { allday, morning, afternoon }

enum LeaveActions { request, cancel }

enum LeaveStatus { waitforapproval, waitforpreapproval, approved, rejected }

String getLeaveHourDisplayText(LeaveHours leaveHours) {
  String leaveHourDisplayText;
  if (leaveHours == LeaveHours.allday) {
    leaveHourDisplayText = '${leaveHours.name[0].toUpperCase()}'
        '${leaveHours.name.substring(1, 3)} '
        '${leaveHours.name.substring(3)}';
  } else {
    leaveHourDisplayText =
        leaveHours.name[0].toUpperCase() + leaveHours.name.substring(1);
  }

  return leaveHourDisplayText;
}

String getLeaveTypeDisplayText(LeaveTypes leaveType) {
  String leaveTypeDisplayText;
  if (leaveType == LeaveTypes.withoutPay) {
    leaveTypeDisplayText = '${leaveType.name[0].toUpperCase()}'
        '${leaveType.name.substring(1, 7)} '
        '${leaveType.name.substring(7)} ';
  } else {
    leaveTypeDisplayText =
        leaveType.name[0].toUpperCase() + leaveType.name.substring(1);
  }

  return leaveTypeDisplayText;
}

String getLeaveActionDisplayText(LeaveActions leaveAction) {
  String leaveActionDisplayText;

  leaveActionDisplayText =
      leaveAction.name[0].toUpperCase() + leaveAction.name.substring(1);

  return leaveActionDisplayText;
}

String getLeaveStatusDisplayText(LeaveStatus leaveStatus) {
  String leaveStatusDisplayText;
  if (leaveStatus == LeaveStatus.waitforapproval) {
    leaveStatusDisplayText = '${leaveStatus.name[0].toUpperCase()}'
        '${leaveStatus.name.substring(1, 4)} '
        '${leaveStatus.name.substring(4, 7)} '
        '${leaveStatus.name.substring(7)}';
  } else if (leaveStatus == LeaveStatus.waitforpreapproval) {
    leaveStatusDisplayText = '${leaveStatus.name[0].toUpperCase()}'
        '${leaveStatus.name.substring(1, 4)} '
        '${leaveStatus.name.substring(4, 7)} '
        '${leaveStatus.name.substring(7, 10)}-'
        '${leaveStatus.name.substring(10)}';
  } else {
    leaveStatusDisplayText =
        leaveStatus.name[0].toUpperCase() + leaveStatus.name.substring(1);
  }

  return leaveStatusDisplayText;
}

class Leave {
  Leave(
      {required this.startDate,
      required this.endDate,
      required this.leaveHour,
      this.leaveType,
      this.employee,
      this.isUrgent,
      this.attachment,
      this.taskDetails,
      this.leaveAction,
      this.leaveStatus}) {
    if (leaveType != null) {
      if (leaveHour == LeaveHours.allday) {
        totalLeaveDays = (endDate.difference(startDate).inDays + 1) * 1.0;
      } else {
        totalLeaveDays = 0.5;
      }
    } else {
      totalLeaveDays = 0;
    }

    attachment ??= [];
    leaveAction ??= LeaveActions.request;
    leaveStatus ??= LeaveStatus.waitforpreapproval;
    isUrgent ??= false;
  }

  DateTime startDate;
  DateTime endDate;
  LeaveTypes? leaveType;
  bool? isUrgent;
  LeaveHours? leaveHour;
  String? taskDetails;
  List<Map<File, Widget>>? attachment;
  Employee? employee;
  double? totalLeaveDays;
  LeaveActions? leaveAction;
  LeaveStatus? leaveStatus;

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

  Leave copywith(
      {DateTime? startDate,
      DateTime? endDate,
      LeaveTypes? leaveType,
      bool? isUrgent,
      LeaveHours? leaveHour,
      String? taskDetails,
      List<Map<File, Widget>>? attachment,
      Employee? employee,
      LeaveActions? leaveAction,
      LeaveStatus? leaveStatus}) {
    return Leave(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        leaveHour: leaveHour ?? this.leaveHour,
        employee: employee ?? this.employee,
        leaveType: leaveType ?? this.leaveType,
        isUrgent: isUrgent ?? this.isUrgent,
        attachment: attachment ?? this.attachment,
        taskDetails: taskDetails ?? this.taskDetails,
        leaveAction: leaveAction ?? this.leaveAction,
        leaveStatus: leaveStatus ?? this.leaveStatus);
  }
}
