import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/annual_statistic_box.dart';

class AnnualStatistics extends ConsumerStatefulWidget {
  const AnnualStatistics({super.key});

  @override
  ConsumerState<AnnualStatistics> createState() => _AnnualStatisticsState();
}

class _AnnualStatisticsState extends ConsumerState<AnnualStatistics> {
  final ItemScrollController itemScrollController = ItemScrollController();

  bool isScrollRight = false;

  @override
  Widget build(BuildContext context) {
    final leaveQuotaList = ref.watch(leaveQuotaProvider);

    return SizedBox(
      height: 200,
      child: ScrollablePositionedList.builder(
          itemCount: leaveQuotaList.length,
          scrollDirection: Axis.horizontal,
          itemScrollController: itemScrollController,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onHorizontalDragEnd: _onHorizontalDragEnd,
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx < 0) {
                  isScrollRight = true;
                } else {
                  isScrollRight = false;
                }
              },
              child: AnnualStatisticBox(
                leaveQuota: leaveQuotaList[index],
              ),
            );
          }),
    );
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final leaveQuotaList = ref.watch(leaveQuotaProvider);
    final leaveIndex = ref.watch(leaveIndexProvider);

    if (isScrollRight && leaveIndex < leaveQuotaList.length) {
      ref.read(leaveIndexProvider.notifier).onChangeYear(leaveIndex + 1);

      itemScrollController.scrollTo(
          index: leaveIndex + 1, duration: const Duration(milliseconds: 200));
    } else if (isScrollRight == false && leaveIndex > 0) {
      ref.read(leaveIndexProvider.notifier).onChangeYear(leaveIndex - 1);

      itemScrollController.scrollTo(
          index: leaveIndex - 1, duration: const Duration(milliseconds: 200));
    }
  }
}
