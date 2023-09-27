import 'package:flutter/material.dart';
import 'package:timesheet/routes/route.dart';
import 'package:timesheet/widgets/fade_in_route.dart';
import 'package:timesheet/widgets/nav_icon.dart';

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
      selectedLabelStyle: TextStyle(
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
      onTap: (index) {
        String routeName = '/home';
        if (index == 0) {
          routeName = '/home';
        } else if (index == 1) {
          routeName = '/timesheet';
        } else if (index == 2) {
          routeName = '/project';
        } else if (index == 3) {
          routeName = '/leave';
        } else if (index == 4) {
          routeName = '/account';
        }
        // Navigator.pushReplacementNamed(context, routeName);

        Navigator.pushReplacement(
          // or pushReplacement, if you need that
          context,
          FadeInRoute(
            routeName: routeName,
            page: routes[routeName]!(context),
          ),
        );
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          icon: const NavIcon('icon-home-inactive.png'),
          label: 'Home',
          activeIcon: const NavIcon('icon-home-active.png'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          icon: const NavIcon('icon-sheet-inactive.png'),
          label: 'Timesheet',
          activeIcon: const NavIcon('icon-sheet-active.png'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          icon: const NavIcon('icon-doc-inactive.png'),
          label: 'Project',
          activeIcon: const NavIcon('icon-doc-active.png'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          icon: const NavIcon('icon-date-inactive.png'),
          label: 'Leave',
          activeIcon: const NavIcon('icon-date-active.png'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          icon: const NavIcon('icon-account-inactive.png'),
          label: 'Account',
          activeIcon: const NavIcon('icon-account-active.png'),
        ),
      ],
    );
  }
}
