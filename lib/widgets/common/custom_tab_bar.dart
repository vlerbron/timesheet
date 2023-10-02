import 'package:flutter/material.dart';
import 'package:timesheet/utils/const.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kColorLightGrey,
      ),
      height: 40,
      child: TabBar(
          unselectedLabelColor: kColorDarkGrey,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          tabs: tabs),
    );
  }
}
