import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/provider_container.dart';

class CurrentLeaveQuotaProvider {
  final provider = Provider((ref) {
    final leaveQuotas = ref.watch(leaveQuotaProvider);
    final leaveIndex = ref.watch(leaveIndexProvider);
    return leaveQuotas[leaveIndex];
  });
}
