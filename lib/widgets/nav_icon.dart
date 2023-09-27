import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  const NavIcon(
    this.name, {
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/$name', height: 30);
  }
}
