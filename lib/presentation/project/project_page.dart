import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';
import 'package:timesheet/presentation/widgets/project/project_detail.dart';
import 'package:timesheet/presentation/widgets/project/project_filter.dart';
import 'package:timesheet/presentation/widgets/project/project_issues.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.project});
  final ProjectEntity project;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project board'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          ProjectDetail(project: widget.project),
          const ProjectFilter(),
          Divider(
            thickness: 10,
            color: Theme.of(context).colorScheme.secondary,
          ),
          ProjectIssues(widget.project),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 2),
    );
  }
}
