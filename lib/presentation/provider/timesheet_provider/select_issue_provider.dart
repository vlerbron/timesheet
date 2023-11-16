import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_select_issue.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

class SelectIssueProvider extends StateNotifier<List<SelectIssueEntity>> {
  SelectIssueProvider() : super(dummySelectIssue);

  List<SelectIssueEntity> filterSelectIssues(String value) {
    return state
        .where((issue) =>
            issue.title.contains(value) || issue.issueNo.contains(value)
            || issue.projectCode.contains(value) || issue.clientCode.contains(value))
        .toList();
  }
}
