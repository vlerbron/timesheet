import 'package:timesheet/models/employee_model.dart';
import 'package:timesheet/models/leave_model.dart';

List<Leave> dummyLeaves = [
  Leave(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, 9, 15),
    endDate: DateTime(2023, 9, 30),
    employee: Employee(
        firstName: 'Gnan',
        lastName: 'Hnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '1nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.personal,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '2nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '3nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '4nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.withoutPay,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '5nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Anan',
        lastName: '6nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Cnan',
        lastName: 'Dnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.afternoon,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    employee: Employee(
        firstName: 'Enan',
        lastName: 'Fnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day - 7),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day - 5),
    leaveAction: LeaveActions.cancel,
    leaveStatus: LeaveStatus.rejected,
    employee: Employee(
        firstName: 'Nuntuch',
        lastName: 'Ruangsri',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  Leave(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.afternoon,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day + 5),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day + 7),
    employee: Employee(
        firstName: 'Nuntuch',
        lastName: 'Ruangsri',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
];
