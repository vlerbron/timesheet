import 'package:flutter/material.dart';
import 'package:timesheet/pages/home.dart';
import 'package:timesheet/pages/time_sheet.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TBN Timesheet",
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/timesheet': (context) => const TimeSheet(),
      },
      theme: ThemeData(useMaterial3: true),
    ),
  );
}
