import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/utils/main_drawer.dart';
import 'package:timesheet/widgets/tabs.dart';

final formatter = DateFormat('EEEE, dd MMMM yyyy');

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Eakarath comment
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to TBN PM"),
      ),
      body: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                'It\'s ',
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                formatter.format(DateTime.now()),
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 54, 25, 196),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
      drawer: const MainDrawer(selectedIndex: 0),
      bottomNavigationBar: const Tabs(selectedIndex: 0),
    );
  }
}
