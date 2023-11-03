import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_state_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/utils/date_time_mixin.dart';
import 'package:timesheet/provider_container.dart';

class StatusNotification extends ConsumerWidget with DateTimeMixin {
  const StatusNotification(this.selectedDate, {super.key});
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final firstDateOfWeek = findFirstDateOfTheWeek(selectedDate);
    TimesheetStateEntity timesheetState =
        ref.watch(timesheetProvider).timesheetStateMap[firstDateOfWeek]!;

    return Container(
      margin: const EdgeInsets.only(
          top: kWidgetLineSpace, left: kWidgetPadding, right: kWidgetPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kWidgetCircularRadius),
        color: timesheetState.bgColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.info_rounded,
                        color: timesheetState.statusColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timesheetState.status.text,
                            style: textTheme.titleMedium
                                ?.copyWith(color: timesheetState.statusColor),
                          ),
                          if (timesheetState.status == TimesheetStatus.reject)
                            Text(
                              timesheetState.detail,
                              style: textTheme.bodySmall
                                  ?.copyWith(color: timesheetState.statusColor),
                            ),
                          if ([TimesheetStatus.approve, TimesheetStatus.reject]
                              .contains(timesheetState.status))
                            Text(
                              'By ${timesheetState.operator.firstName} ${timesheetState.operator.lastName} ${dateFormatterddMMyyyyhhmm.format(timesheetState.txDateTime)}',
                              style: textTheme.bodySmall
                                  ?.copyWith(color: timesheetState.userColor),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
