import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Welcome Sir/Madam.'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              Navigator.pop(context);
              if (selectedIndex != 0) {
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          ListTile(
            title: const Text('Leave'),
            selected: selectedIndex == 1,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Timesheet'),
            selected: selectedIndex == 2,
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              if (selectedIndex != 2) {
                Navigator.popAndPushNamed(context, '/timesheet');
              }
            },
          ),
        ],
      ),
    );
  }
}
