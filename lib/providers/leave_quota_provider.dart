import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/dummy_leave_quota.dart';
import 'package:timesheet/models/leave_quota_model.dart';

class LeaveQuotaNotifier extends StateNotifier<List<LeaveQuota>> {
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

final leaveQuotaProvider =
    StateNotifierProvider<LeaveQuotaNotifier, List<LeaveQuota>>(
        (ref) => LeaveQuotaNotifier());

final leaveIndexProvider =
    StateNotifierProvider<CurrentLeaveIndexNotifier, int>(
        (ref) => CurrentLeaveIndexNotifier());

final currentLeaveQuotaProvider = Provider((ref) {
  final leaveQuotas = ref.watch(leaveQuotaProvider);
  final leaveIndex = ref.watch(leaveIndexProvider);
  return leaveQuotas[leaveIndex];
});
