import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';

List<LeaveEntity> dummyLeaves = [
  LeaveEntity(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, 9, 15),
    endDate: DateTime(2023, 9, 30),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Gnan',
        lastName: 'Hnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '1nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.personal,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '2nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '3nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '4nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.withoutPay,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '5nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.morning,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Anan',
        lastName: '6nan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.special,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Cnan',
        lastName: 'Dnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.afternoon,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Enan',
        lastName: 'Fnan',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.annual,
    leaveHour: LeaveHours.allday,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day - 7),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day - 5),
    isNew: false,
    leaveAction: LeaveActions.cancel,
    leaveStatus: LeaveStatus.rejected,
    employee: EmployeeEntity(
        firstName: 'Nuntuch',
        lastName: 'Ruangsri',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
  LeaveEntity(
    leaveType: LeaveTypes.sick,
    leaveHour: LeaveHours.afternoon,
    startDate: DateTime(2023, DateTime.now().month, DateTime.now().day + 5),
    endDate: DateTime(2023, DateTime.now().month, DateTime.now().day + 7),
    isNew: false,
    employee: EmployeeEntity(
        firstName: 'Nuntuch',
        lastName: 'Ruangsri',
        nickname: 'Nan',
        employeeStartDate: DateTime(2023, 1, 16)),
  ),
];
