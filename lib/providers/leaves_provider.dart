import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/data/dummy_leaves.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/providers/selected_date_provider.dart';

// final leavesProvider = Provider((ref) {
//   return dummyLeaves;
// });

class LeaveNotifier extends StateNotifier<List<Leave>> {
  LeaveNotifier() : super(dummyLeaves);

  void leaveAdded(Leave leave) {
    state = [...state, leave];
  }
}

final leavesProvider =
    StateNotifierProvider<LeaveNotifier, List<Leave>>((ref) => LeaveNotifier());

final filteredLeaveProvider = Provider((ref) {
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
