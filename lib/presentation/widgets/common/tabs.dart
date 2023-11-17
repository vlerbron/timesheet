import 'package:flutter/material.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/presentation/widgets/common/fade_in_route.dart';
import 'package:timesheet/presentation/widgets/common/nav_icon.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      selectedLabelStyle: TextStyle(
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
      onTap: (index) {
        String routeName = Routes.homePage;
        if (index == 0) {
          routeName = Routes.homePage;
        } else if (index == 1) {
          routeName = Routes.timesheetPage;
        } else if (index == 2) {
          routeName = Routes.myProjectsPage;
        } else if (index == 3) {
          routeName = Routes.leavePage;
        } else if (index == 4) {
          routeName = Routes.accountPage;
        }
        // Navigator.pushReplacementNamed(context, routeName);

        Navigator.pushReplacement(
          // or pushReplacement, if you need that
          context,
          FadeInRoute(
            routeName: routeName,
            page: Routes.routes[routeName]!(context),
          ),
        );
      },
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: NavIcon('icon-home-inactive.png'),
          label: 'Home',
          activeIcon: NavIcon('icon-home-active.png'),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('icon-sheet-inactive.png'),
          label: 'Timesheet',
          activeIcon: NavIcon('icon-sheet-active.png'),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('icon-doc-inactive.png'),
          label: 'Project',
          activeIcon: NavIcon('icon-doc-active.png'),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('icon-date-inactive.png'),
          label: 'Leave',
          activeIcon: NavIcon('icon-date-active.png'),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('icon-account-inactive.png'),
          label: 'Account',
          activeIcon: NavIcon('icon-account-active.png'),
        ),
      ],
    );
  }
}
