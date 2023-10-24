import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';

class TimesheetNotifier extends StateNotifier<TimesheetEntity> {
  TimesheetNotifier()
      : super(TimesheetEntity(
          selectedDate: DateTime.now().copyWith(
              hour: 0,
              minute: 0,
              second: 0,
              millisecond: 0,
              microsecond: 0,
              isUtc: true),
          timeRemaining: const Duration(),
          status: TimesheetStatus.active,
        ));

  void setSelectedDate(
      {bool isBefore = true, required bool is7Days, dynamic dateTime}) {
    if (is7Days) {
      state.selectedDate = isBefore
          ? state.selectedDate.subtract(const Duration(days: 7))
          : state.selectedDate.add(const Duration(days: 7));
    } else {
      DateTime d = dateTime;
      state.selectedDate = d.copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
          isUtc: true);
    }
    state.isShowTasksMap
        .forEach((key, value) => state.isShowTasksMap[key] = false);
  }

  void setIsShowTasks(String dayOfWeek, bool isShowTasks) {
    state.isShowTasksMap[dayOfWeek] = isShowTasks;
  }
}