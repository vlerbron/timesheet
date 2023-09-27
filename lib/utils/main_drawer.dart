import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: StreamBuilder<QuerySnapshot<Map>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: authenticatedUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = snapshot.data!.docs[0].data();
            final String username = user['username'];
            final String imagePath =
                user['image_url'] ?? 'assets/images/logo.png';

            return ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      if (imagePath != null && imagePath != '')
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            imagePath,
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(180),
                          radius: 23,
                        ),
                      Text('Welcome $username'),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  selected: selectedIndex == 0,
                  onTap: () {
                    Navigator.pop(context);
                    if (selectedIndex != 0) {
                      Navigator.pushReplacementNamed(context, '/home');
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
                      Navigator.pushReplacementNamed(context, '/timesheet');
                    }
                  },
                ),
                ListTile(
                  title: const Text('Logout'),
                  selected: selectedIndex == 3,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            );
          }),
    );
  }
}
