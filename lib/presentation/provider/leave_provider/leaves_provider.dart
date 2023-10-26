import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_leaves.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';

class LeaveNotifier extends StateNotifier<List<LeaveEntity>> {
  LeaveNotifier() : super(dummyLeaves);

  void leaveAdded(LeaveEntity leave) {
    state = [...state, leave];
  }
}
