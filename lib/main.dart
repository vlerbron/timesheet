import 'package:flutter/material.dart';
import 'package:timesheet/firebase_options.dart';
import 'package:timesheet/pages/auth.dart';
import 'package:timesheet/pages/home.dart';
import 'package:timesheet/pages/splash.dart';
import 'package:timesheet/pages/time_sheet.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "TBN Timesheet",
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const Home(),
        '/timesheet': (context) => const TimeSheet(),
      },
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
    ),
  );
}
