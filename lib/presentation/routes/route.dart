import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/presentation/pages/account/account_page.dart';
import 'package:timesheet/presentation/pages/account/edit_account_page.dart';
import 'package:timesheet/presentation/pages/home/home_page.dart';
import 'package:timesheet/presentation/pages/leave/leave_page.dart';
import 'package:timesheet/presentation/pages/leave/new_leave_request_page.dart';
import 'package:timesheet/presentation/pages/timesheet/new_edit_task_page.dart';
import 'package:timesheet/presentation/project/my_projects_page.dart';
import 'package:timesheet/presentation/pages/timesheet/timesheet_page.dart';
import 'package:timesheet/presentation/pages/login/login_page.dart';
import 'package:timesheet/presentation/pages/login/splash_page.dart';
import 'package:timesheet/presentation/project/project_page.dart';

class Routes {
  static const String rootPage = '/';
  static const String loginPage = '/auth';
  static const String homePage = '/home';
  static const String timesheetPage = '/timesheet';
  static const String myProjectsPage = '/myProjects';
  static const String leavePage = '/leave';
  static const String newLeavePage = '/new-leave';
  static const String accountPage = '/account';
  static const String newEditTaskPage = '/new-edit-task';
  static const String editAccountPage = '/edit-account';
  static const String projectPage = '/project';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.rootPage: (context) => const SplashPage(),
    Routes.loginPage: (context) => const LoginPage(),
    Routes.homePage: (context) => const HomePage(),
    Routes.timesheetPage: (context) => const TimesheetPage(),
    Routes.myProjectsPage: (context) => const MyProjectsPage(),
    Routes.leavePage: (context) => const LeavePage(),
    Routes.newLeavePage: (context) => const NewLeaveRequestPage(),
    Routes.accountPage: (context) => const AccountPage(),
    Routes.newEditTaskPage: (context) => const NewEditTaskPage(),
    Routes.editAccountPage: (context) => const EditAccountPage(),
    Routes.projectPage: (context) => ProjectPage(
        project: ModalRoute.of(context)?.settings.arguments as ProjectEntity),
  };
}
