import 'package:timesheet/domain/repositories/login_repository.dart';
import 'package:timesheet/domain/use_case/login_use_case/local_use_case/get_app_version_use_case.dart';
import 'package:timesheet/domain/use_case/login_use_case/local_use_case/get_login_status_use_case.dart';
import 'package:timesheet/domain/use_case/login_use_case/local_use_case/get_token_use_case.dart';
import 'package:timesheet/domain/use_case/login_use_case/local_use_case/logout_use_case.dart';

import 'remote_use_case/get_user_profile_use_case.dart';
import 'remote_use_case/login_use_case.dart';

class LoginUseCaseAdapter {
  final LoginRepository loginRepository;

  LoginUseCaseAdapter(this.loginRepository);

  //remote use case
  GetUserProfileUseCase get getUserProfileUseCase =>
      GetUserProfileUseCase(loginRepository);

  LoginUseCase get loginUseCase => LoginUseCase(loginRepository);

//local use case
  GetLoginStatusUseCase get getLoginStatusUseCase =>
      GetLoginStatusUseCase(loginRepository);

  GetTokenUseCase get getTokenUseCase => GetTokenUseCase(loginRepository);

  LogoutUseCase get logoutUseCase => LogoutUseCase(loginRepository);

  GetAppVersionUseCase get getAppVersionUseCase =>
      GetAppVersionUseCase(loginRepository);
}
