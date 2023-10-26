import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';
import 'package:timesheet/domain/use_case/login_use_case/login_use_case_adapter.dart';
import 'package:timesheet/domain/use_case/login_use_case/remote_use_case/login_use_case.dart';
import 'package:timesheet/domain/use_case/use_case_template/usecase.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';

class LoginProvider extends StateNotifier<LoginState> {
  final LoginUseCaseAdapter loginUseCaseAdapter;
  UserProfileEntity? _profile;
  String _appVersion = "";

  UserProfileEntity? get profile => _profile;
  String get appVersion => _appVersion;

  LoginProvider(this.loginUseCaseAdapter) : super(const LoginState.initial());

  Future<void> getUserProfile() async {
    state = const LoginState.loading();
    await loginUseCaseAdapter.getUserProfileUseCase.execute(NoParams()).then(
        (result) => state = result.fold(
            (failure) => LoginState.failure(failure),
            (data) => const LoginState.success()));
  }

  Future<void> getLocalUserProfile() async {
    state = const LoginState.loading();
    final profile =
        await loginUseCaseAdapter.getUserProfileUseCase.getLocalUserProfile();
    _profile = profile;
    state = const LoginState.success();
  }

  Future<void> login(
      {required String username, required String password}) async {
    state = const LoginState.loading();
    await loginUseCaseAdapter.loginUseCase
        .execute(ParamLogin(username: username, password: password))
        .then((result) => state = result.fold(
            (failure) => LoginState.failure(failure),
            (data) => const LoginState.success()));
  }

  Future<void> logout() async {
    state = const LoginState.loading();
    await loginUseCaseAdapter.logoutUseCase.execute();
    state = const LoginState.success();
  }

  Future<void> getAppVersion() async {
    state = const LoginState.loading();
    await loginUseCaseAdapter.getAppVersionUseCase.execute().then((value) {
      _appVersion = value;
    });
  }

  Future<bool> getIsLoginStatus() async {
    return await loginUseCaseAdapter.getLoginStatusUseCase
        .execute()
        .then((value) => value);
  }
}
