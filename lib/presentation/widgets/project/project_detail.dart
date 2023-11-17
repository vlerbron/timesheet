import 'package:flutter/material.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key, required this.project});
  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(kWidgetPadding),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Project',
                style: textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                project.projectName,
                style:
                    textTheme.bodyMedium!.copyWith(color: colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(
            height: kWidgetLineSpace,
          ),
          Row(
            children: [
              Text(
                'Client',
                style: textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                project.clientCode,
                style:
                    textTheme.bodyMedium!.copyWith(color: colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(
            height: kWidgetLineSpace,
          ),
          Row(
            children: [
              Text(
                'Outstanding transactions',
                style: textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                project.outstandingTx.toString(),
                style:
                    textTheme.bodyMedium!.copyWith(color: colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(
            height: kWidgetLineSpace,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, '/');
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(kWidgetCircularRadius),
                    ),
                    side: BorderSide(color: colorScheme.primary),
                  ),
                  child: const Text('Add Issue'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
