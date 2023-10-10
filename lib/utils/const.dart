import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///// Color
/////
const kColorDarkGrey = Color.fromARGB(255, 128, 128, 128);
const kColorLightGrey = Color.fromARGB(255, 240, 240, 240);

const kColorGreyText = Color(0xFF616161);
const kColorDarkGreyText = Color(0xFF242424);

///// Text Style
/////
const kRequiredTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: Colors.red,
);

const double kWidgetCircularRadius = 8;

const double kWidgetPadding = 16;

////// Date formatter
/////
final dateFormatterddMMyyyy = DateFormat('dd/MM/yyyy');
final dateFormatterddMMyyyyhhmm = DateFormat('dd/MM/yyyy hh:mm');

//Use 10.0.2.2 as localhost for test.
const String kBaseURL =
    'https://timesheetbackend-sandbox.mxapps.io/auth/v1/user-authen';
