import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';
import 'package:timesheet/injection_container.dart';
import 'package:timesheet/presentation/provider/leave_provider/provider/current_leave_quota_provider.dart';
import 'package:timesheet/presentation/provider/leave_provider/provider/filtered_leave_provider.dart';
import 'package:timesheet/presentation/provider/leave_provider/notifier/leaves_notifier.dart';
import 'package:timesheet/presentation/provider/leave_provider/provider/my_leave_provider.dart';
import 'package:timesheet/presentation/provider/leave_provider/notifier/selected_date_notifier.dart';
import 'package:timesheet/presentation/provider/login_provider/login/login_provider.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_event_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/provider/leave_provider/notifier/leave_quota_notifier.dart';
import 'package:timesheet/presentation/provider/leave_provider/notifier/leave_request_notifier.dart';

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

final currentLeaveQuotaProvider = locator<CurrentLeaveQuotaProvider>();

final myLeaveProvider = locator<MyLeaveProvider>();

final filteredLeaveProvider = locator<FilteredLeaveProvider>();
