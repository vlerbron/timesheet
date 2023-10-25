import 'package:flutter/material.dart';
import 'package:timesheet/presentation/pages/timesheet/new_edit_task_page.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Project'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: OutlinedButton.icon(
          onPressed: () {
            //NewTask();
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const NewEditTaskPage()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('New task'),
        ),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 2),
    );
  }
}
