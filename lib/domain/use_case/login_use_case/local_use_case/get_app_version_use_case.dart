import 'package:timesheet/domain/repositories/login_repository.dart';

class GetAppVersionUseCase {
  final LoginRepository loginRepository;

  GetAppVersionUseCase(this.loginRepository);

  Future<String> execute() => loginRepository.getAppVersion();
}
