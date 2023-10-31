import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';
import 'package:timesheet/domain/use_case/login_use_case/login_use_case_adapter.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';

class TimesheetProvider extends StateNotifier<TimesheetState> {
  final TimesheetEntity timesheetEntity;
  final Map<DateTime, TimesheetStateEntity> timesheetStateMap;
  final LoginUseCaseAdapter loginUseCaseAdapter;

  TimesheetProvider(
      this.timesheetEntity, this.timesheetStateMap, this.loginUseCaseAdapter)
      : super(TimesheetState(
          timesheetEntity: timesheetEntity,
          timesheetStateMap: timesheetStateMap,
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
    state.timesheetEntity.isShowTasksMap.forEach(
        (key, value) => state.timesheetEntity.isShowTasksMap[key] = false);
  }

  void setIsShowTasks(String dayOfWeek, bool isShowTasks) {
    state.timesheetEntity.isShowTasksMap[dayOfWeek] = isShowTasks;
  }

  //update state
  void submitTimesheetState(
      DateTime key, TimesheetStateEntity stateEntity) async {
    UserProfileEntity? userProfileEntity =
        await loginUseCaseAdapter.getUserProfileUseCase.getLocalUserProfile();
    if (userProfileEntity != null) stateEntity.operator = userProfileEntity;
    state.timesheetStateMap[key]!.setTimesheetStateEntity(stateEntity);
  }
}
