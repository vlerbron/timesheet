import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/datasources/dummies/dummy_leave_quota.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';

class LeaveQuotaNotifier extends StateNotifier<List<LeaveQuotaEntity>> {
  LeaveQuotaNotifier() : super(dummyLeaveQuota.reversed.toList());
}

class CurrentLeaveIndexNotifier extends StateNotifier<int> {
  CurrentLeaveIndexNotifier() : super(0);

  void onChangeYear(int selectIndex) {
    if (selectIndex >= 0 && selectIndex <= dummyLeaveQuota.length - 1) {
      state = selectIndex;
    }
  }
}
