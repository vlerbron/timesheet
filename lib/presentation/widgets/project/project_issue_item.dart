import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

class ProjectIssueItem extends StatelessWidget {
  const ProjectIssueItem({super.key, required this.selectIssueEntity, required this.onTap});

  final void Function(SelectIssueEntity) onTap;

  final SelectIssueEntity selectIssueEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onTap(selectIssueEntity);
        },
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  selectIssueEntity.clientCode,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  selectIssueEntity.projectCode,
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
                  selectIssueEntity.title,
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
                        selectIssueEntity.issueNo,
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
                        selectIssueEntity.status,
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
