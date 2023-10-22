import 'package:timesheet/domain/repositories/login_repository.dart';

class LogoutUseCase {
  final LoginRepository loginRepository;

  LogoutUseCase(this.loginRepository);

  Future<bool> execute() => loginRepository.logout();
}
