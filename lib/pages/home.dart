import 'package:flutter/material.dart';
import 'package:timesheet/utils/main_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to TBN PM"),
      ),
      body: const Text('Home'),
      drawer: const MainDrawer(),
    );
  }
}
