import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/injection_container.dart';
import 'package:timesheet/presentation/provider/login_provider/login/login_provider.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_event_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';

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
