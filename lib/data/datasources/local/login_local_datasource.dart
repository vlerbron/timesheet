// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';
import 'package:timesheet/utils/const.dart';

abstract class LoginLocalDataSource {
  Future<void> storeLoginData({required String token});
  Future<void> storeUserData({required UserProfileEntity userEntity});
  Future<bool> getLoginStatus();
  Future<UserProfileEntity?> getuser();
  Future<String?> getToken();
  Future<bool> logout();
  Future<String> getVersion();
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final ConstantConfig conststantKey;

  LoginLocalDataSourceImpl(this.secureStorage, this.conststantKey);

  @override
  Future<bool> getLoginStatus() async {
    String? isLogin = await secureStorage.read(key: conststantKey.isLogin);
    return isLogin == 'true';
  }

  @override
  Future<String?> getToken() async {
    String? token = await secureStorage.read(key: conststantKey.token);
    return token;
  }

  @override
  Future<void> storeLoginData({
    required String token,
  }) async {
    await secureStorage.write(key: conststantKey.token, value: token);
    await secureStorage.write(key: conststantKey.isLogin, value: 'true');
  }

   @override
  Future<void> storeUserData(
      {required UserProfileEntity userEntity}) async {
    final userDataJson = json.encode(userEntity.toJson());
    await secureStorage.write(
        key: conststantKey.user, value: userDataJson);
  }

  @override
  Future<UserProfileEntity?> getuser() async {
    final userJson = await secureStorage.read(key: conststantKey.user);
    if (userJson != null) {
      final userDataMap = json.decode(userJson);
      return UserProfileEntity.fromJson(userDataMap);
    }
    return null;
  }

  @override
  Future<bool> logout() async {
    await secureStorage.deleteAll().then((value) {
      return true;
    });
    return false;
  }

  @override
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
