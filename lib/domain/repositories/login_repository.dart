import 'package:dartz/dartz.dart';
import 'package:timesheet/data/exception.dart';
import 'package:timesheet/domain/entities/login/login_entity.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';

abstract class LoginRepository {
  Future<Either<AppException, LoginEntity>> login({
    required String username,
    required String password,
  });
  Future<Either<AppException, UserProfileEntity>> getUserProfile();
  //local
  Future<String> getAppVersion();

  Future<bool> getLoginStatus();

  Future<UserProfileEntity?> getLocalUserProfile();

  Future<String?> getToken();

  Future<bool> logout();
}
