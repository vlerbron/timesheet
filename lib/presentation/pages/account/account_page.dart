import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/widgets/account/account_dashboard.dart';
import 'package:timesheet/presentation/widgets/account/account_expense.dart';
import 'package:timesheet/presentation/widgets/common/button/custom_tab_bar.dart';
import 'package:timesheet/presentation/widgets/common/name_avatar.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginNotifier = ref.watch(loginProvider.notifier);
    final myAccount = ref.watch(myAccountProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Account'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
          child: Column(
            children: [
              Row(
                children: [
                  NameAvatar(
                    backgroundColor: const Color.fromARGB(255, 207, 228, 250),
                    textColor: const Color.fromARGB(255, 15, 84, 140),
                    size: 48,
                    text: myAccount.avatarText,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(myAccount.nickname),
                      Text(
                        myAccount.position,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded))
                ],
              ),
              const Divider(height: 30),
              const CustomTabBar(
                tabs: [
                  Tab(
                    icon: Text('Dashboard'),
                  ),
                  Tab(
                    icon: Text('Expense'),
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                    children: [AccountDashboard(), AccountExpense()]),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        loginNotifier.logout();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 30, 128, 184),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Log out'),
                    )
                  ]),
            ],
          ),
        ),
        bottomNavigationBar: const Tabs(selectedIndex: 4),
      ),
    );
  }
}
