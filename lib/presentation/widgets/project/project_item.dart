import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem(
      {super.key, required this.projectEntity, required this.onTap});

  final void Function(ProjectEntity) onTap;

  final ProjectEntity projectEntity;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onTap(projectEntity);
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    projectEntity.projectName,
                    style: textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Text('${projectEntity.projectCode} ${projectEntity.clientCode}',
                    style:
                        textTheme.bodyMedium!.copyWith(color: kColorGreyText)),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
