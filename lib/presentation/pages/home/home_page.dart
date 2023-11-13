import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/annual_statistic_box.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final currentLeaveQuota = ref.read(currentLeaveQuotaProvider.provider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cloud.png"),
                  alignment: Alignment.bottomRight,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 249, 253, 255),
                    Color.fromARGB(0, 220, 251, 253),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: kWidgetPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome to TBN PM',
                          style: textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 19,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'It\'s ',
                          style: textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          dateFormatterEEEEddMMMMyyyy.format(DateTime.now()),
                          style: textTheme.titleLarge!.copyWith(
                            color: colorScheme.primary,
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kWidgetPadding),
              child: AnnualStatisticData(
                leaveQuota: currentLeaveQuota,
                showHeader: false,
                showHoliday: true,
                textColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 0),
    );
  }
}
