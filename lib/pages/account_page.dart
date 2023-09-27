import 'package:flutter/material.dart';
import 'package:timesheet/widgets/tabs.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 4),
    );
  }
}
