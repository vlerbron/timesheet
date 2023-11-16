// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

class ProjectEntity {
  String projectCode;
  String projectName;
  String clientCode;
  List<SelectIssueEntity> issueList;

  ProjectEntity({
    required this.projectCode,
    required this.projectName,
    required this.clientCode,
    required this.issueList,
  });
}
