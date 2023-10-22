import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/data/exception.dart';
import 'package:timesheet/domain/entities/login/login_entity.dart';
import 'package:timesheet/domain/repositories/login_repository.dart';
import 'package:timesheet/domain/use_case/use_case_template/usecase.dart';

class LoginUseCase implements UseCase<LoginEntity, ParamLogin> {
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<Either<AppException, LoginEntity>> execute(ParamLogin param) {
    return loginRepository.login(
        username: param.username, password: param.password);
  }
}

class ParamLogin extends Equatable {
  final String username;
  final String password;

  const ParamLogin({required this.username, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
