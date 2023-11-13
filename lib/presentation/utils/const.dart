import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///// Color
/////
const kColorDarkGrey = Color.fromARGB(255, 128, 128, 128);
const kColorMidtGrey = Color.fromARGB(255, 240, 240, 240);
const kColorLightGrey = Color.fromARGB(255, 250, 250, 250);

const kColorGreyText = Color(0xFF616161);
const kColorDarkGreyText = Color(0xFF242424);
const kColorLightBlue = Color.fromARGB(255, 245, 248, 253);

const kColorLightGreen = Color.fromRGBO(139, 195, 74, 1);

const kColorGreyBackground = Color.fromARGB(255, 245, 246, 248);
///// Text Style
/////
const kRequiredTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: Colors.red,
);

const double kWidgetCircularRadius = 8;

const double kWidgetPadding = 16;
const double kWidgetLineSpace = 10;

////// Date formatter
/////
final dateFormatterddMMyyyy = DateFormat('dd/MM/yyyy');
final dateFormatterddMMyyyyhhmm = DateFormat('dd/MM/yyyy hh:mm');
final dateFormatterddEEEEyyyy = DateFormat('dd EEEE yyyy');
final dateFormatterddMMMyyyy = DateFormat('dd MMM yyyy');
final dateFormatterEEEEddMMMMyyyy = DateFormat('EEEE, dd MMMM yyyy');

const String kBaseURL = 'BASE_URL';

//Day of Week
const String kMonday = 'Monday';
const String kTuesday = 'Tuesday';
const String kWednesday = 'Wednesday';
const String kThursday = 'Thursday';
const String kFriday = 'Friday';
const String kSaturday = 'Saturday';
const String kSunday = 'Sunday';

//Timesheet
class TimesheetRebuildEvent {
  static const String kTimesheetRebuild = 'timesheetRebuild';
}

class ConstantConfig {
  final String token = 'TOKEN';
  final String isLogin = 'IS_LOGIN';
  final String user = 'USER';
}

class HostPath {
  static const String auth = '/auth/v1';
  static const String login = '$auth/user-authen';
  static const String getUserProfile = '$auth/get-user-profile';
}
