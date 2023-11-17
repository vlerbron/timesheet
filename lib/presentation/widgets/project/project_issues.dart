import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/project/project_issue_item.dart';
import 'package:timesheet/provider_container.dart';

class ProjectIssues extends ConsumerStatefulWidget {
  const ProjectIssues(this.project, {super.key});
  final ProjectEntity project;

  @override
  ConsumerState<ProjectIssues> createState() => _ProjectIssuesState();
}

class _ProjectIssuesState extends ConsumerState<ProjectIssues> {
  final _searchController = TextEditingController();
  late List<SelectIssueEntity> _selectIssueList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectIssueList = ref
        .read(selectIssueProvider.notifier)
        .selectIssuesByProjectCode(widget.project.projectCode);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              autofocus: false,
              controller: _searchController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorScheme.secondary,
                hintText: 'Project code, project name, or client code',
                hintStyle:
                    textTheme.bodyMedium!.copyWith(color: kColorDarkGrey),
                suffixIcon: IconButton(
                  icon: Image.asset('assets/icons/icon-close.png'),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _selectIssueList = ref
                          .read(selectIssueProvider.notifier)
                          .selectIssuesByProjectCode(
                              widget.project.projectCode);
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kWidgetCircularRadius),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) {
                setState(() {
                  _selectIssueList = ref
                      .read(selectIssueProvider.notifier)
                      .filterSelectIssuesByProjectCode(
                          widget.project.projectCode, val);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectIssueList.length,
              itemBuilder: (context, index) => ProjectIssueItem(
                selectIssueEntity: _selectIssueList[index],
                onTap: (SelectIssueEntity entity) {
                  // Navigator.of(context).pushNamed(Routes.projectPage, arguments: entity);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
