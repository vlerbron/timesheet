import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';

class ProjectIssueItem extends StatelessWidget {
  const ProjectIssueItem(
      {super.key, required this.selectIssueEntity, required this.onTap});

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
                  selectIssueEntity.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  iconSize: 14,
                )
              ],
            ),
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
                  'Priority',
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        selectIssueEntity.priority.name.replaceFirst(
                            selectIssueEntity.priority.name[0],
                            selectIssueEntity.priority.name[0].toUpperCase()),
                        style:
                            TextStyle(color: selectIssueEntity.priority.color),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(
                selectIssueEntity.responsedPersonList.length,
                (index) => CircleAvatar(
                  backgroundImage: AssetImage(
                      selectIssueEntity.responsedPersonList[index].imageUrl!),
                  radius: 14,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
