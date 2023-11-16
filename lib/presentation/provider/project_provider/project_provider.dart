import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/data/datasources/dummies/dummy_project_list.dart';

class ProjectProvider extends StateNotifier<List<ProjectEntity>> {
  ProjectProvider() : super(dummyProjectList);

  List<ProjectEntity> filterProjectList(String value) {
    return state
        .where((project) =>
            project.projectName.contains(value) ||
            project.projectCode.contains(value) ||
            project.clientCode.contains(value))
        .toList();
  }
}
