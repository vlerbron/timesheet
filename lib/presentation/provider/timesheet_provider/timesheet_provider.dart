import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';

class TimesheetProvider extends StateNotifier<TimesheetState> {
  final TimesheetEntity timesheetEntity;
  TimesheetProvider(this.timesheetEntity)
      : super(TimesheetState(
          timesheetEntity: timesheetEntity,
          timesheetStatus: TimesheetStatus.active,
        ));

  void setSelectedDate(
      {bool isBefore = true, required bool is7Days, dynamic dateTime}) {
    if (is7Days) {
      state.timesheetEntity.selectedDate = isBefore
          ? state.timesheetEntity.selectedDate.subtract(const Duration(days: 7))
          : state.timesheetEntity.selectedDate.add(const Duration(days: 7));
    } else {
      DateTime d = dateTime;
      state.timesheetEntity.selectedDate = d.copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
          isUtc: true);
    }
    state.timesheetEntity.isShowTasksMap
        .forEach((key, value) => state.timesheetEntity.isShowTasksMap[key] = false);
  }

  void setIsShowTasks(String dayOfWeek, bool isShowTasks) {
    state.timesheetEntity.isShowTasksMap[dayOfWeek] = isShowTasks;
  }
}
