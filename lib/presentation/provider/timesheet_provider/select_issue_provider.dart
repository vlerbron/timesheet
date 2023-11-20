import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_select_issue.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

class SelectIssueProvider extends StateNotifier<List<SelectIssueEntity>> {
  SelectIssueProvider() : super(dummySelectIssue);

  List<SelectIssueEntity> filterSelectIssues(String value) {
    return _filterListByValue(state, value);
  }

  List<SelectIssueEntity> selectIssuesByProjectCode(String projectCode) {
    return state.where((issue) => issue.projectCode == projectCode).toList();
  }

  List<SelectIssueEntity> filterSelectIssuesByProjectCode(
      String projectCode, String value) {
    return _filterListByValue(selectIssuesByProjectCode(projectCode), value);
  }

  List<SelectIssueEntity> _filterListByValue(
      List<SelectIssueEntity> issues, String value) {
    return issues
        .where((issue) =>
            issue.title.contains(value) ||
            issue.issueNo.contains(value) ||
            issue.projectCode.contains(value) ||
            issue.clientCode.contains(value))
        .toList();
  }

  void sortIssues(List<SelectIssueEntity> issues) {
    issues.sort(
        (issue1, issue2) => issue1.title.compareTo(issue2.title));
  }
}
