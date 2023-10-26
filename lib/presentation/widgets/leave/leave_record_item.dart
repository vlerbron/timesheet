import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/provider_container.dart';

import '../../utils/const.dart';

class LeaveRecordItem extends ConsumerWidget {
  const LeaveRecordItem({
    super.key,
    required this.leave,
  });

  final LeaveEntity leave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getLeaveTypeDisplayText(leave.leaveType!),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            Row(
              children: [
                Text(
                  getLeaveHourDisplayText(leave.leaveHour!),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Visibility(
                  visible: leave.leaveStatus != LeaveStatus.waitforpreapproval,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(leaveRequestProvider.notifier)
                          .onEditLeave(leave);
                      Navigator.of(context).pushNamed(Routes.newLeavePage);
                    },
                    child: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            Text(
                '${dateFormatterddMMyyyy.format(leave.startDate)} - ${dateFormatterddMMyyyy.format(leave.endDate)}'),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Action',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            Row(
              children: [
                Text(
                  getLeaveActionDisplayText(leave.leaveAction!),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: leaveActionsColor[leave.leaveAction!]),
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  leaveActionsIcon[leave.leaveAction!],
                  color: leaveActionsColor[leave.leaveAction!],
                  size: 16,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Status',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            Row(
              children: [
                Text(
                  getLeaveStatusDisplayText(leave.leaveStatus!),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: leaveStatusColor[leave.leaveStatus!]),
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  leaveStatusIcon[leave.leaveStatus!],
                  color: leaveStatusColor[leave.leaveStatus!],
                  size: 16,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: double.infinity,
          child: Visibility(
            visible: leave.leaveStatus == LeaveStatus.waitforpreapproval,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _showBottomsheet(context);
                  },
                  child: const Text('Request for cancel'),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showBottomsheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please confirm',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Are you sure you want to cancel?',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: kColorMidtGrey,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'No',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          //TODO: sent cancel Leave request
                        },
                        child: const Text(
                          'Yes',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
