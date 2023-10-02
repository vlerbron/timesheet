import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateNotifier extends StateNotifier<DateTime> {
  SelectedDateNotifier()
      : super(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: DateTime.now().weekday - 1)));

  void onSelectDate(DateTime selectedDate) {
    //state is the begining of the week(monday)
    state = selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
  }
}

final selectedDateProvider =
    StateNotifierProvider<SelectedDateNotifier, DateTime>(
        (ref) => SelectedDateNotifier());
