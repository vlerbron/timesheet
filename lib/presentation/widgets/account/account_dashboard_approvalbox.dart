import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/account/account_dashboard_header.dart';

class AccountDashboardApprovalBox extends StatelessWidget {
  const AccountDashboardApprovalBox({
    super.key,
    required this.title,
    required this.iconPath,
    required this.preApproverList,
    required this.approverList,
  });

  final String title;
  final String iconPath;
  final List<EmployeeEntity> preApproverList;
  final List<EmployeeEntity> approverList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountDashboardHeader(
          title: title,
          iconPath: iconPath,
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kColorGreyBackground),
          child: Column(
            children: [
              Column(
                children: preApproverList
                    .map((preApprover) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                    visible:
                                        preApproverList.indexOf(preApprover) ==
                                            0,
                                    child: const Text('Pre Approver')),
                                Text(
                                    '${preApprover.firstName} ${preApprover.lastName} (${preApprover.nickname})')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text(preApprover.position)],
                            ),
                          ],
                        ))
                    .toList(),
              ),
              Column(
                children: approverList
                    .map((approver) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                    visible:
                                        approverList.indexOf(approver) == 0,
                                    child: const Text('Approver')),
                                Text(
                                    '${approver.firstName} ${approver.lastName} (${approver.nickname})'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text(approver.position)],
                            ),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
