import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';
import 'package:timesheet/injection_container.dart';
import 'package:timesheet/presentation/provider/leave_provider/leaves_provider.dart';
import 'package:timesheet/presentation/provider/leave_provider/selected_date_provider.dart';
import 'package:timesheet/presentation/provider/login_provider/login/login_provider.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_event_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/provider/leave_provider/leave_quota_provider.dart';
import 'package:timesheet/presentation/provider/leave_provider/leave_request_provider.dart';

//*login
var loginProvider = locator<StateNotifierProvider<LoginProvider, LoginState>>();

//*timesheet
var timesheetProvider =
    locator<StateNotifierProvider<TimesheetProvider, TimesheetState>>();
var taskListProvider =
    locator<StateNotifierProvider<TaskListProvider, List<TaskEntity>>>();
var timesheetEventProvider =
    locator<StateNotifierProvider<TimesheetEventProvider, EventEmitter>>();
var taskProvider = locator<StateNotifierProvider<TaskProvider, TaskState>>();

//*leave

final leaveRequestProvider =
    locator<StateNotifierProvider<LeaveRequestNotifier, LeaveEntity>>();

final leavesProvider =
    locator<StateNotifierProvider<LeaveNotifier, List<LeaveEntity>>>();

final leaveQuotaProvider = locator<
    StateNotifierProvider<LeaveQuotaNotifier, List<LeaveQuotaEntity>>>();
final leaveIndexProvider =
    locator<StateNotifierProvider<CurrentLeaveIndexNotifier, int>>();

final selectedDateProvider =
    locator<StateNotifierProvider<SelectedDateNotifier, DateTime>>();

final currentLeaveQuotaProvider = Provider((ref) {
  final leaveQuotas = ref.watch(leaveQuotaProvider);
  final leaveIndex = ref.watch(leaveIndexProvider);
  return leaveQuotas[leaveIndex];
});

final myLeaveProvider = Provider((ref) {
  final List<LeaveEntity> leaves = ref.watch(leavesProvider);
  return leaves.where(
    (leave) =>
        leave.employee ==
        //TODO: current user
        EmployeeEntity(
          firstName: 'Nuntuch',
          nickname: 'Nan',
          employeeStartDate: DateTime(2023, 1, 16),
        ),
  );
});

final filteredLeaveProvider = Provider((ref) {
  final leaves = ref.watch(leavesProvider);
  final sundayOfTheweek = ref.watch(selectedDateProvider);
  final saturdayOfTheweek = sundayOfTheweek.add(const Duration(days: 6));
  return leaves.where((leave) {
    ///leave within this week
    if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
            leave.startDate.isAfter(sundayOfTheweek)) &&
        (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
            leave.endDate.isBefore(saturdayOfTheweek))) {
      return true;
    }

    ///leave start before and end after this week
    else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
            leave.startDate.isBefore(sundayOfTheweek)) &&
        (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
            leave.endDate.isAfter(saturdayOfTheweek))) {
      return true;
    }

    ///leave start before and end within this week
    else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
            leave.startDate.isBefore(sundayOfTheweek)) &&
        (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
            leave.endDate.isBefore(saturdayOfTheweek)) &&
        (leave.endDate.isAtSameMomentAs(sundayOfTheweek) ||
            leave.endDate.isAfter(sundayOfTheweek))) {
      return true;
    }

    ///leave start within this week and end after this week
    else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
            leave.startDate.isAfter(sundayOfTheweek)) &&
        (leave.startDate.isAtSameMomentAs(saturdayOfTheweek) ||
            leave.startDate.isBefore(saturdayOfTheweek)) &&
        (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
            leave.endDate.isAfter(saturdayOfTheweek))) {
      return true;
    }
    return false;
  }).toList();
});
