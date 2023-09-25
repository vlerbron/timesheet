import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/pages/auth.dart';
import 'package:timesheet/pages/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('TBN Splash'),
              ),
              body: const Center(
                child: Text('Loading...'),
              ),
            );
          } else if (snapshot.hasData) {
            return const Home();
          } else {
            return const AuthScreen();
          }
        });
  }
}
