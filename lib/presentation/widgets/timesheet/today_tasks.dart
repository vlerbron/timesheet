import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/timesheet/task_item.dart';
import 'package:timesheet/provider_container.dart';

class TodayTasks extends ConsumerStatefulWidget {
  const TodayTasks(this.todayDate, {super.key});
  final DateTime todayDate;

  @override
  ConsumerState<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends ConsumerState<TodayTasks> {
  bool _isShowTasks = false;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<TaskEntity> taskList =
        ref.read(taskListProvider.notifier).getTaskListbyDate(widget.todayDate);

    return Container(
      margin: const EdgeInsets.only(
          bottom: kWidgetPadding, left: kWidgetPadding, right: kWidgetPadding),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.secondary),
          bottom: BorderSide(color: colorScheme.secondary),
          left: BorderSide(color: colorScheme.secondary),
          right: BorderSide(color: colorScheme.secondary),
        ),
        borderRadius: BorderRadius.circular(kWidgetCircularRadius),
        color: colorScheme.background,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.14),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      String.fromCharCode(
                          CupertinoIcons.circle_filled.codePoint),
                      style: TextStyle(
                        inherit: false,
                        color: colorScheme.primary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: CupertinoIcons.circle.fontFamily,
                        package: CupertinoIcons.circle.fontPackage,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Today',
                      style: textTheme.titleMedium
                          ?.copyWith(color: kColorDarkGreyText),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isShowTasks = !_isShowTasks;
                        });
                      },
                      icon: (_isShowTasks)
                          ? Icon(
                              Icons.arrow_drop_up,
                              color: colorScheme.primary,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: colorScheme.primary,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isShowTasks,
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: colorScheme.secondary)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: taskList.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) => TaskItem(
                        taskList[index],
                        isShowDeleteTask: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
