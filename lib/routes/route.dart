import 'package:flutter/material.dart';
import 'package:timesheet/pages/account_page.dart';
import 'package:timesheet/pages/home_page.dart';
import 'package:timesheet/pages/leave_page.dart';
import 'package:timesheet/pages/login_page.dart';
import 'package:timesheet/pages/new_task_page.dart';
import 'package:timesheet/pages/project_page.dart';
import 'package:timesheet/pages/timesheet_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const LoginPage(),
  '/auth': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/timesheet': (context) => const TimesheetPage(),
  '/project': (context) => const ProjectPage(),
  '/leave': (context) => const LeavePage(),
  '/account': (context) => const AccountPage(),
  '/new-task': (context) => const NewTaskPage(),
};
