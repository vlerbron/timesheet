import 'package:flutter/material.dart';
import 'package:timesheet/pages/account_page.dart';
import 'package:timesheet/pages/home_page.dart';
import 'package:timesheet/pages/leave_page.dart';
import 'package:timesheet/pages/new_task_page.dart';
import 'package:timesheet/pages/project_page.dart';
import 'package:timesheet/pages/timesheet_page.dart';
import 'package:timesheet/presentation/pages/login/login_page.dart';
import 'package:timesheet/presentation/pages/login/splash_page.dart';

class Routes {
  static const String rootPage = '/';
  static const String loginPage = '/auth';
  static const String homePage = '/home';
  static const String timesheetPage = '/timesheet';
  static const String projectPage = '/project';
  static const String leavePage = '/leave';
  static const String accountPage = '/account';
  static const String newTaskPage = '/new-task';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.rootPage: (context) => const SplashPage(),
    Routes.loginPage: (context) => const LoginPage(),
    Routes.homePage: (context) => const HomePage(),
    Routes.timesheetPage: (context) => const TimesheetPage(),
    Routes.projectPage: (context) => const ProjectPage(),
    Routes.leavePage: (context) => const LeavePage(),
    Routes.accountPage: (context) => const AccountPage(),
    Routes.newTaskPage: (context) => NewTaskPage(
        choosedDate: ModalRoute.of(context)?.settings.arguments as DateTime),
  };
}
