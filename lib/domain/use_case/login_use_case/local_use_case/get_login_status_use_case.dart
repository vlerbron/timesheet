import 'package:timesheet/domain/repositories/login_repository.dart';

class GetLoginStatusUseCase {
  final LoginRepository loginRepository;

  GetLoginStatusUseCase(this.loginRepository);

  Future<bool> execute() => loginRepository.getLoginStatus();
}
