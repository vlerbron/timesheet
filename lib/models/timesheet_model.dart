import 'package:flutter/material.dart';

class TimesheetModel {
  DateTime selectedDate;
  int timeRemainingHour;
  int timeRemainingMinute;
  final Map<String, Color> allDayOfWeek = {
    'Monday': const Color(0xFFFFD700),
    'Tuesday': const Color(0xFFFF4081),
    'Wednesday': const Color(0xFF8BC34A),
    'Thursday': const Color(0xFFFFA500),
    'Friday': const Color(0xFF66CCFF),
    'Saturday': const Color(0xFF7F28C1),
    'Sunday': const Color(0xFFFF3219),
  };

  TimesheetModel({
    required this.selectedDate,
    required this.timeRemainingHour,
    required this.timeRemainingMinute,
  });
}
