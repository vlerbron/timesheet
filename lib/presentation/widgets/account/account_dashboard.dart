import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/account/account_dashboard_approvalbox.dart';
import 'package:timesheet/presentation/widgets/account/account_dashboard_box.dart';
import 'package:timesheet/presentation/widgets/account/account_dashboard_item.dart';

class AccountDashboard extends StatelessWidget {
  const AccountDashboard({super.key, required this.employeeEntity});

  final EmployeeEntity employeeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountDashboardBox(
                content: dateFormatterddMMMyyyy
                    .format(employeeEntity.employeeStartDate),
                title: 'Employee start date'),
            const SizedBox(
              width: 10,
            ),
            AccountDashboardBox(
                content: employeeEntity.actualWorkPeriodString,
                title: 'Actual work period'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AccountDashboardItem(
          title: 'Full name',
          content:
              '${employeeEntity.firstName} ${employeeEntity.lastName ?? ''}',
        ),
        AccountDashboardItem(
          title: 'Username',
          content: employeeEntity.username,
        ),
        const Divider(),
        AccountDashboardApprovalBox(
          title: 'Timesheet Approval',
          iconPath: 'assets/icons/icon-sheet.png',
          preApproverList: employeeEntity.timesheetPreApprovers ?? [],
          approverList: employeeEntity.timesheetApprovers ?? [],
        ),
        AccountDashboardApprovalBox(
          title: 'Leave Approval',
          iconPath: 'assets/icons/icon-date.png',
          preApproverList: employeeEntity.leavePreApprovers ?? [],
          approverList: employeeEntity.leaveApprovers ?? [],
        ),
      ],
    );
  }
}
