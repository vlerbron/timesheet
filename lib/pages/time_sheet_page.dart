import 'package:flutter/material.dart';
import 'package:timesheet/utils/main_drawer.dart';

class TimeSheetPage extends StatefulWidget {
  const TimeSheetPage({super.key});

  @override
  State<TimeSheetPage> createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TBN Timesheet"),
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 15),
            labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            tabs: <Widget>[
              Text("Dashboard"),
              Text("Overview"),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const MainDrawer(selectedIndex: 2),
      ),
    );
  }
}
