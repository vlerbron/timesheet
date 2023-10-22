import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:timesheet/data/datasources/local/login_local_datasource.dart';
import 'package:timesheet/data/datasources/remote/login_remote_datasource.dart';
import 'package:timesheet/data/exception.dart';
import 'package:timesheet/domain/entities/login/login_entity.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';
import 'package:timesheet/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  LoginRepositoryImpl(this.loginRemoteDataSource, this.loginLocalDataSource);

  @override
  Future<Either<AppException, LoginEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      String version = await loginLocalDataSource.getVersion();

      final result = await loginRemoteDataSource.login(
        username: username,
        password: password,
        version: version,
      );

      if (result.token != null) {
        await loginLocalDataSource.storeLoginData(token: result.token!);
        return Right(result.toEntity());
      } else {
        return Left(AppException(message: 'Service failure'));
      }
    } on DioException catch (e) {
      return Left(AppException(message: e.response?.data?['Description'] ?? 'Server Exception'));
    }
  }

  @override
  Future<Either<AppException, UserProfileEntity>> getUserProfile() async {
    try {
      final result = await loginRemoteDataSource.getUserProfile();
      await loginLocalDataSource.storeUserData(userEntity: result.toEntity());
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<bool> getLoginStatus() async {
    final result = await loginLocalDataSource.getLoginStatus();
    return result;
  }

  @override
  Future<String?> getToken() async {
    final result = await loginLocalDataSource.getToken();
    return result;
  }

  @override
  Future<UserProfileEntity?> getLocalUserProfile() async {
    final result = await loginLocalDataSource.getuser();
    return result;
  }

  @override
  Future<bool> logout() async {
    final result = await loginLocalDataSource.logout();
    return result;
  }

  @override
  Future<String> getAppVersion() async {
    final result = await loginLocalDataSource.getVersion();
    return result;
  }
}
