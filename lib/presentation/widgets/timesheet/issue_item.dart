import 'package:flutter/material.dart';
import 'package:timesheet/models/select_issue_model.dart';

class IssueItem extends StatelessWidget {
  const IssueItem({super.key, required this.selectIssueModel});

  final SelectIssueModel selectIssueModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  selectIssueModel.clientCode,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  selectIssueModel.projectCode,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  selectIssueModel.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Issue No.',
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        selectIssueModel.issueNo,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Status',
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        selectIssueModel.status,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
