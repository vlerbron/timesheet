import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/provider_container.dart';

class MyLeaveProvider {
  final provider = Provider((ref) {
    final List<LeaveEntity> leaves = ref.watch(leavesProvider);
    return leaves.where(
      (leave) =>
          leave.employee ==
          //TODO: current user
          EmployeeEntity(
            firstName: 'Nuntuch',
            nickname: 'Nan',
            employeeStartDate: DateTime(2023, 1, 16),
          ),
    );
  });
}
