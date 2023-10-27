import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/provider_container.dart';

class MyLeaveProvider {
  final provider = Provider((ref) {
    final List<LeaveEntity> leaves = ref.watch(leavesProvider);
    final EmployeeEntity myAccount = ref.watch(myAccountProvider);
    return leaves.where((leave) => leave.employee == myAccount);
  });
}
