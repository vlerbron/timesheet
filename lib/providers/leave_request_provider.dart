import 'dart:io';

import 'package:file_previewer/file_previewer.dart';
import 'package:flutter/material.dart';
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
    state = state.copywith(isUrgent: checkboxSts);
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

  Future<void> onAddAttachment(File file) async {
    late Widget thumbnail;
    try {
      thumbnail = await FilePreview.getThumbnail(file.path);
    } catch (e) {
      thumbnail = Image.asset("");
    }
    state = state.copywith(attachment: [
      ...state.attachment!,
      {file: thumbnail}
    ]);
  }

  void onRemoveAttachment(Widget valueWidget) {
    state.attachment!.removeWhere((att) => att.containsValue(valueWidget));
    state = state.copywith(attachment: state.attachment);
  }

  void onEditLeave(Leave leave) {
    state = leave.copywith(
      attachment: leave.attachment,
      employee: leave.employee,
      endDate: leave.endDate,
      isUrgent: leave.isUrgent,
      leaveAction: leave.leaveAction,
      leaveHour: leave.leaveHour,
      leaveStatus: leave.leaveStatus,
      leaveType: leave.leaveType,
      startDate: leave.startDate,
      taskDetails: leave.taskDetails,
    );
  }
}

final leaveRequestProvider = StateNotifierProvider<LeaveRequestNotifier, Leave>(
    (ref) => LeaveRequestNotifier());
