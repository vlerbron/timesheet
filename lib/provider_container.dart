import 'package:timesheet/injection_container.dart';
import 'package:timesheet/presentation/provider/login_provider/login/login_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_event_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';

LoginProvider loginProvider = locator<LoginProvider>();

TimesheetProvider timesheetProvider = locator<TimesheetProvider>();
TaskListProvider taskListProvider = locator<TaskListProvider>();
TimesheetEventProvider timesheetEventProvider = locator<TimesheetEventProvider>();