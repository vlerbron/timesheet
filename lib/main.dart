import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet/injection_container.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/presentation/utils/const.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 249, 253, 255),
  background: const Color.fromARGB(255, 255, 255, 255),
  primary: const Color.fromARGB(255, 30, 128, 184),
  secondary: const Color(0xffF0F0F0),
  primaryContainer: kColorLightGrey,
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
  await dotenv.load(fileName: '.env');
  //Initialize locale
  FlavorConfig(
    name: 'sandbox',
    variables: {
      kBaseURL: dotenv.env['BASE_URL']!,
    },
  );
  await init();
  
  runApp(
    ProviderScope(
      child: MaterialApp(
          title: "TBN Timesheet",
          initialRoute: '/',
          routes: Routes.routes,
          theme: theme),
    ),
  );
}
