import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet/firebase_options.dart';
import 'package:timesheet/pages/login_page.dart';
import 'package:timesheet/pages/home_page.dart';
import 'package:timesheet/pages/splash_page.dart';
import 'package:timesheet/pages/timesheet_page.dart';
import 'package:firebase_core/firebase_core.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 249, 253, 255),
  background: const Color.fromARGB(255, 255, 255, 255),
  primary: const Color.fromARGB(255, 30, 128, 184),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 249, 253, 255),
    //other options
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MaterialApp(
          title: "TBN Timesheet",
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashPage(),
            '/auth': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/timesheet': (context) => const TimesheetPage(),
          },
          theme: theme),
    ),
  );
}
