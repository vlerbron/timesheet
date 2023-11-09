import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';

class MyAccountNotifier extends StateNotifier<EmployeeEntity> {
  MyAccountNotifier()
      : super(
          EmployeeEntity(
            firstName: 'Nuntuch',
            lastName: 'Ruangsri',
            nickname: 'Nan',
            employeeCode: 'Emp100',
            username: 'nununtuch.r',
            employeeStartDate: DateTime(2023, 1, 16),
            position: 'Developer',
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/600px-Pierre-Person.jpg',
            leavePreApprovers: [
              EmployeeEntity(
                firstName: 'Leave',
                lastName: 'PreApprover',
                nickname: 'LeavePre',
                employeeCode: 'Emp101',
                username: 'leave.p',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Leave Pre',
              ),
              EmployeeEntity(
                firstName: 'Leave2',
                lastName: 'PreApprover',
                nickname: 'LeavePre',
                employeeCode: 'Emp101',
                username: 'leave.p',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Leave Pre',
              )
            ],
            leaveApprovers: [
              EmployeeEntity(
                firstName: 'Leave',
                lastName: 'Approver',
                nickname: 'LeaveApp',
                employeeCode: 'Emp102',
                username: 'leave.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Leave App',
              ),
              EmployeeEntity(
                firstName: 'Leave2',
                lastName: 'Approver',
                nickname: 'LeaveApp',
                employeeCode: 'Emp102',
                username: 'leave.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Leave App',
              )
            ],
            timesheetPreApprovers: [
              EmployeeEntity(
                firstName: 'Timesheet',
                lastName: 'PreApprover',
                nickname: 'TimesheetPre',
                employeeCode: 'Emp201',
                username: 'timesheet.p',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet Pre',
              ),
              EmployeeEntity(
                firstName: 'Timesheet2',
                lastName: 'PreApprover',
                nickname: 'TimesheetPre',
                employeeCode: 'Emp201',
                username: 'timesheet.p',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet Pre',
              )
            ],
            timesheetApprovers: [
              EmployeeEntity(
                firstName: 'Timesheet',
                lastName: 'Approver',
                nickname: 'TimesheetApp',
                employeeCode: 'Emp202',
                username: 'timesheet.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet App',
              ),
              EmployeeEntity(
                firstName: 'Timesheet2',
                lastName: 'Approver',
                nickname: 'TimesheetApp',
                employeeCode: 'Emp202',
                username: 'timesheet.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet App',
              ),
              EmployeeEntity(
                firstName: 'Timesheet3',
                lastName: 'Approver',
                nickname: 'TimesheetApp',
                employeeCode: 'Emp202',
                username: 'timesheet.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet App',
              ),
              EmployeeEntity(
                firstName: 'Timesheet4',
                lastName: 'Approver',
                nickname: 'TimesheetApp',
                employeeCode: 'Emp202',
                username: 'timesheet.a',
                employeeStartDate: DateTime(2023, 1, 16),
                position: 'Timesheet App',
              ),
            ],
          ),
        );

//TODO:add another attibute to hold the image in the form that can sent to update backend
  void onSaveEditAccount(String nickname, String imageUrl) {
    state = state.copyWith(nickname: nickname, imageUrl: imageUrl);
  }
}
