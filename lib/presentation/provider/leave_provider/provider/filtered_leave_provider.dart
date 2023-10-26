import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/provider_container.dart';

class FilteredLeaveProvider {
  final provider = Provider((ref) {
    final leaves = ref.watch(leavesProvider);
    final sundayOfTheweek = ref.watch(selectedDateProvider);
    final saturdayOfTheweek = sundayOfTheweek.add(const Duration(days: 6));
    return leaves.where((leave) {
      ///leave within this week
      if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
              leave.startDate.isAfter(sundayOfTheweek)) &&
          (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
              leave.endDate.isBefore(saturdayOfTheweek))) {
        return true;
      }

      ///leave start before and end after this week
      else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
              leave.startDate.isBefore(sundayOfTheweek)) &&
          (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
              leave.endDate.isAfter(saturdayOfTheweek))) {
        return true;
      }

      ///leave start before and end within this week
      else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
              leave.startDate.isBefore(sundayOfTheweek)) &&
          (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
              leave.endDate.isBefore(saturdayOfTheweek)) &&
          (leave.endDate.isAtSameMomentAs(sundayOfTheweek) ||
              leave.endDate.isAfter(sundayOfTheweek))) {
        return true;
      }

      ///leave start within this week and end after this week
      else if ((leave.startDate.isAtSameMomentAs(sundayOfTheweek) ||
              leave.startDate.isAfter(sundayOfTheweek)) &&
          (leave.startDate.isAtSameMomentAs(saturdayOfTheweek) ||
              leave.startDate.isBefore(saturdayOfTheweek)) &&
          (leave.endDate.isAtSameMomentAs(saturdayOfTheweek) ||
              leave.endDate.isAfter(saturdayOfTheweek))) {
        return true;
      }
      return false;
    }).toList();
  });
}
