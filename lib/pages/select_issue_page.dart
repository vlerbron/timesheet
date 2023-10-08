import 'package:flutter/material.dart';

import 'package:timesheet/models/select_issue_model.dart';
import 'package:timesheet/widgets/timesheet/issue_item.dart';

class SelectIssuePage extends StatelessWidget {
  const SelectIssuePage({super.key, required this.selectIssueModels});

  final List<SelectIssueModel> selectIssueModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Issue',
        ),
      ),
      body: ListView.builder(
        itemCount: selectIssueModels.length,
        itemBuilder: (context, index) => IssueItem(
          selectIssueModel: selectIssueModels[index],
        ),
      ),
    );
  }
}
