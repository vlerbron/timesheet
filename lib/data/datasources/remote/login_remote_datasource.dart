// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:timesheet/data/exception.dart';
import 'package:timesheet/data/model/login/login_model.dart';
import 'package:timesheet/data/model/login/user_profile_model.dart';
import 'package:timesheet/utils/const.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login({
    required String username,
    required String password,
    required String version,
  });

  Future<UserProfileModel> getUserProfile();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;
  final String _baseUrl = FlavorConfig.instance.variables[kBaseURL];

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginModel> login(
      {required String username,
      required String password,
      required String version}) async {
    final response = await dio.post(_baseUrl + HostPath.login, data: {
      'UserName': username,
      'Password': password,
      'Version': version,
    });

    if (response.statusCode == 200 && response.data['ResponseCode'] == '000') {
      final res =
          Map<String, dynamic>.from(response.data as Map<String, dynamic>);
      final result = LoginModel.fromJson(res);
      return result;
    } else {
      throw DioException(
          requestOptions: RequestOptions(baseUrl: _baseUrl + HostPath.login),
          response: response);
    }
  }

  @override
  Future<UserProfileModel> getUserProfile() async {
    final response = await dio.post(_baseUrl + HostPath.login, data: {});

    if (response.statusCode == 200) {
      final res =
          Map<String, dynamic>.from(response.data as Map<String, dynamic>);
      final result = UserProfileModel.fromJson(res);
      return result;
    } else {
      throw AppException(message: 'Server Error!');
    }
  }
}
