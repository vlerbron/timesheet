import 'package:flutter/material.dart';
import 'package:timesheet/widgets/tabs.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Calendar'),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 3),
    );
  }
}
