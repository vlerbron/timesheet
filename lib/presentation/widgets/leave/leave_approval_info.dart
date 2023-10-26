import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';

class LeaveApprovalInfo extends StatelessWidget {
  const LeaveApprovalInfo({
    super.key,
    required this.leave,
  });

  final LeaveEntity leave;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: leave.leaveStatus != LeaveStatus.waitforapproval &&
          leave.leaveStatus != LeaveStatus.waitforpreapproval,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Approval Information',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: kColorMidtGrey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Action',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                        Row(
                          children: [
                            Text(
                              getLeaveActionDisplayText(leave.leaveAction!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: leaveActionsColor[
                                          leave.leaveAction!]),
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
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                        Row(
                          children: [
                            Text(
                              getLeaveStatusDisplayText(leave.leaveStatus!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          leaveStatusColor[leave.leaveStatus!]),
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
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pre-approved by',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                        //TODO: add pre-approver name
                        const Text('Mr.Pre Approver'),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          //TODO: pre-approver date
                          dateFormatterddMMyyyyhhmm.format(leave.endDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Approved by',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                        //TODO: add approver name
                        const Text('Mr.Approver Tbn'),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          //TODO: approver date
                          dateFormatterddMMyyyyhhmm.format(leave.endDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
