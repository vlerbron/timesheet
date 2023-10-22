import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timesheet/presentation/provider/login_provider/login/state/login_notifier.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';

class LoginProvider {
  final StateNotifierProvider<LoginNotifier, LoginState> provider;
  LoginProvider(this.provider);
}
