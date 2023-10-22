import 'package:timesheet/domain/repositories/login_repository.dart';

class GetTokenUseCase {
  final LoginRepository loginRepository;

  GetTokenUseCase(this.loginRepository);

  Future<String?> execute() => loginRepository.getToken();
}
