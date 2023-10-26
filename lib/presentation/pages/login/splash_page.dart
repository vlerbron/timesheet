import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/routes/route.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await ref
            .read(FutureProvider<bool>((ref) async {
          final provider = ref.watch(loginProvider.notifier);
          return await provider.getIsLoginStatus();
        }).future)
            .then(
          (isUserLoggedIn) {
            if (isUserLoggedIn) {
              Navigator.of(context).pushReplacementNamed(Routes.homePage);
            } else {
              Navigator.of(context).pushReplacementNamed(Routes.loginPage);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
