import 'package:flutter/material.dart';
import 'package:timesheet/widgets/tabs.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Project'),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 2),
    );
  }
}
