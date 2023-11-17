import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/button/floating_add_button_extended.dart';
import 'package:timesheet/presentation/widgets/home/today_tasks.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/annual_statistic_box.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EventEmitter events = ref.watch(timesheetEventProvider);
    events.on(TimesheetRebuildEvent.kTimesheetRebuild, (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final currentLeaveQuota = ref.read(currentLeaveQuotaProvider.provider);
    final todayDate = DateTime.now().toUtc().copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  dateFormatterEEEEddMMMMyyyy
                                      .format(DateTime.now()),
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
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      kWidgetCircularRadius),
                                  color: const Color(0xFFCFE4FA),
                                ),
                                child: Image.asset(
                                    'assets/icons/icon-remain-leave-quota.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: kWidgetLineSpace),
                                child: Text(
                                  'Remain leave quota',
                                  style: textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kWidgetCircularRadius),
                                  ),
                                  side: BorderSide(color: colorScheme.primary),
                                ),
                                child: const Text('New Request'),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: kWidgetLineSpace),
                            child: AnnualStatisticData(
                              leaveQuota: currentLeaveQuota,
                              showHeader: false,
                              showHoliday: true,
                              textColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View more',
                                style: textTheme.titleMedium!
                                    .copyWith(color: colorScheme.primary),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  color: colorScheme.primary,
                                  onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kWidgetPadding),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kWidgetCircularRadius),
                              color: const Color(0xFFCFE4FA),
                            ),
                            child: Image.asset('assets/icons/icon-sheet.png'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: kWidgetLineSpace),
                            child: Text(
                              'Timesheet',
                              style: textTheme.titleLarge!.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TodayTasks(todayDate),
                  ],
                ),
              ),
            ),
            FloatingAddButtonExtended(
                label: 'Add Task',
                onPressed: () {
                  ref.read(taskProvider.notifier).setNewTaskState(
                      DateFormat('EEEE').format(todayDate), todayDate);
                  Navigator.of(context).pushNamed(Routes.newEditTaskPage);
                }),
          ],
        ),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 0),
    );
  }
}
