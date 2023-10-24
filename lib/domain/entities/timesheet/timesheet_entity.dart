import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class TimesheetEntity{
  DateTime selectedDate;
  Duration timeRemaining;

  final Map<String, Color> allDayOfWeekColorMap = {
    kMonday: const Color(0xFFFFD700),
    kTuesday: const Color(0xFFFF4081),
    kWednesday: const Color(0xFF8BC34A),
    kThursday: const Color(0xFFFFA500),
    kFriday: const Color(0xFF66CCFF),
    kSaturday: const Color(0xFF7F28C1),
    kSunday: const Color(0xFFFF3219),
  };

  final Map<String, bool> isShowTasksMap = {
    kMonday: false,
    kTuesday: false,
    kWednesday: false,
    kThursday: false,
    kFriday: false,
    kSaturday: false,
    kSunday: false,
  };

  TimesheetEntity({
    required this.selectedDate,
    required this.timeRemaining,
  });
  
}
