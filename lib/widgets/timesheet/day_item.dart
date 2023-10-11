import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/models/timesheet_model.dart';
import 'package:timesheet/providers/timesheet_provider.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/utils/date_time_mixin.dart';
import 'package:timesheet/widgets/timesheet/task_item.dart';

class DayItem extends ConsumerStatefulWidget {
  const DayItem(this.dayOfWeek, this.dayColor, this.selectedDate, {super.key});
  final String dayOfWeek;
  final Color dayColor;
  final DateTime selectedDate;

  @override
  ConsumerState<DayItem> createState() => _DayItemState();
}

class _DayItemState extends ConsumerState<DayItem> with DateTimeMixin {
  @override
  Widget build(BuildContext context) {
    final TimesheetModel timesheetModel = ref.watch(timesheetProvider);
    bool isShowTasks = timesheetModel.isShowTasksMap[widget.dayOfWeek]!;
    DateTime selectedDate = widget.selectedDate;
    final firstDateOfWeek = findFirstDateOfTheWeek(selectedDate);
    final dayIndex = timesheetModel.allDayOfWeekColorMap.keys
        .toList()
        .indexOf(widget.dayOfWeek);
    final widgetDate = firstDateOfWeek.add(Duration(days: dayIndex));
    final List<TaskModel> taskList = ref
        .read(taskListProvider.notifier)
        .getTaskListbyDayOfWeek(widget.dayOfWeek, firstDateOfWeek,
            findLastDateOfTheWeek(selectedDate));
    final TimesheetNotifier timesheetNotifier =
        ref.read(timesheetProvider.notifier);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
                      String.fromCharCode(CupertinoIcons.circle.codePoint),
                      style: TextStyle(
                        inherit: false,
                        color: widget.dayColor,
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
                      widget.dayOfWeek,
                      style: textTheme.titleMedium
                          ?.copyWith(color: kColorDarkGreyText),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        timesheetNotifier.setIsShowTasks(
                            widget.dayOfWeek, !isShowTasks);
                        setState(() {
                          isShowTasks =
                              timesheetModel.isShowTasksMap[widget.dayOfWeek]!;
                        });
                      },
                      icon: (isShowTasks)
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
            visible: isShowTasks,
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: colorScheme.secondary)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        timesheetNotifier.setSelectedDate(
                            is7Days: false, dateTime: widgetDate);
                        Navigator.of(context).pushNamed('/new-task');
                      },
                      child: Text(
                        'Add Task',
                        style: textTheme.titleMedium
                            ?.copyWith(color: colorScheme.primary),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ListView.builder(
                      itemCount: taskList.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) => TaskItem(taskList[index]),
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
