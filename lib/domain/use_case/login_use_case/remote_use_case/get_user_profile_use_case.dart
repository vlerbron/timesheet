import 'package:dartz/dartz.dart';
import 'package:timesheet/data/exception.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';
import 'package:timesheet/domain/repositories/login_repository.dart';
import 'package:timesheet/domain/use_case/use_case_template/usecase.dart';

class GetUserProfileUseCase implements UseCase<UserProfileEntity, NoParams> {
  final LoginRepository loginRepository;
  GetUserProfileUseCase(this.loginRepository);

  @override
  Future<Either<AppException, UserProfileEntity>> execute(NoParams param) {
    return loginRepository.getUserProfile();
  }

  Future<UserProfileEntity?> getLocalUserProfile() {
    return loginRepository.getLocalUserProfile();
  }
}
