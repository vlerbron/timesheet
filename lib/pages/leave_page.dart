import 'package:flutter/material.dart';
import 'package:timesheet/widgets/tabs.dart';
import 'package:timesheet/pages/leave_tabs/calendar_tab.dart';
import 'package:timesheet/pages/leave_tabs/records_tab.dart';
import 'package:timesheet/pages/leave_tabs/quota_tab.dart';
import 'package:timesheet/widgets/common/custom_tab_bar.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Leave Calendar'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: const Column(
            children: [
              CustomTabBar(
                tabs: [
                  Tab(
                    icon: Text('Calendar'),
                  ),
                  Tab(
                    icon: Text('Records'),
                  ),
                  Tab(
                    icon: Text('Quota'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  CalendarTab(),
                  LeaveRecords(),
                  QuotaTab(),
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Tabs(selectedIndex: 3),
      ),
    );
  }
}
