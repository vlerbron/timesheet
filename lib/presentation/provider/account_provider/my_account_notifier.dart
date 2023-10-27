import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';

class MyAccountNotifier extends StateNotifier<EmployeeEntity> {
  MyAccountNotifier()
      : super(
          EmployeeEntity(
            firstName: 'Nuntuch',
            lastName: 'Ruangsri',
            nickname: 'Nan',
            employeeStartDate: DateTime(2023, 1, 16),
            position: 'Developer',
          ),
        );
}
