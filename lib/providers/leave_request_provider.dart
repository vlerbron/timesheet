import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/leave_model.dart';

class LeaveRequestNotifier extends StateNotifier<Leave> {
  LeaveRequestNotifier()
      : super(Leave(
          startDate: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          endDate: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          leaveHour: LeaveHours.allday,
          isUrgent: false,
        ));

  void onUrgentCheckboxChange(bool? checkboxSts) {
    state = state.copywith(isUrgent: checkboxSts ?? false);
  }

  void onStartDateChange(DateTime startDate) {
    state = state.copywith(startDate: startDate);
  }

  // bool get isAfterEndDate {
  //   return state.startDate.isAfter(state.endDate);
  // }

  void onEndDateChange(DateTime endDate) {
    state = state.copywith(endDate: endDate);
  }

  void onStartDateEndDateChange(DateTime startDate, DateTime endDate) {
    state = state.copywith(startDate: startDate, endDate: endDate);
  }

  void onLeaveTypeChange(dynamic leaveType) {
    state = state.copywith(leaveType: leaveType);
  }

  void onLeaveHourChange(dynamic leaveHour) {
    state = state.copywith(leaveHour: leaveHour);
  }

  void onTaskDetailChange(String detail) {
    state = state.copywith(taskDetails: detail);
  }

  void onAddAttachment(File file) {
    state = state.copywith(attachment: [...state.attachment!, file]);
  }

  void onRemoveAttachment(File file) {
    state.attachment!.remove(file);
    state = state.copywith(attachment: state.attachment);
  }
}

final leaveRequestProvider = StateNotifierProvider<LeaveRequestNotifier, Leave>(
    (ref) => LeaveRequestNotifier());
