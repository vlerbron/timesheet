import 'package:flutter/material.dart';
import 'package:timesheet/presentation/widgets/common/button/custom_tab_bar.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';
import 'package:timesheet/presentation/widgets/leave/calendar_tab.dart';
import 'package:timesheet/presentation/widgets/leave/quota_tab.dart';
import 'package:timesheet/presentation/widgets/leave/records_tab.dart';

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
