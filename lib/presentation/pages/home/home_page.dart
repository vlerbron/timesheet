import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/providers/leave_quota_provider.dart';
import 'package:timesheet/widgets/leave_tabs/annual_statistic_box.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

final formatter = DateFormat('EEEE, dd MMMM yyyy');

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLeaveQuota = ref.read(currentLeaveQuotaProvider);
    // Eakarath comment
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to TBN PM"),
      ),
      body: Column(
        children: [
          Container(
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
            ),
          ),
          AnnualStatisticData(
            leaveQuota: currentLeaveQuota,
            showHeader: false,
            showHoliday: true,
            textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 0),
    );
  }
}
