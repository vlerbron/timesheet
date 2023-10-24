// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:timesheet/presentation/utils/const.dart';

// Project imports:

class DioInterceptor implements Interceptor {
  final _env = FlavorConfig.instance.name;
  final secureStorage = const FlutterSecureStorage();
  final constantConfig = ConstantConfig();

  @override
  void onRequest(options, handler) async {
    String? authToken = await secureStorage.read(key: constantConfig.token);

    if (options.headers['content-type'] == null) {
      options.headers['content-type'] = 'application/json';
    }

    if (options.headers['accept'] == null) {
      options.headers['accept'] = 'application/json';
    }

    if (authToken != null && authToken != '') {
      options.headers.addAll({'Authorization': 'Bearer $authToken'});
    }

    //options.connectTimeout = const Duration(seconds: 30);

    if (_env == 'sandbox') {
      log('${options.method}|${options.path} | ${options.data} | $authToken');
    }

    handler.next(options);
  }

  @override
  void onError(err, handler) {
    if (_env == 'sandbox') {
      log('onError : ${err.response?.statusCode} | ${err.response?.data}');
    }

    // time out
    if (err.response?.statusCode == null) {
      log('Error connection timeout');
    }

    // 403 Not allowed to access this resource
    if (err.response?.statusCode == 403) {
      log('${err.response?.data['error']['message']}');
    }

    // 405 Method Not Allowed
    if (err.response?.statusCode == 405) {
      log('${err.response?.data['Description']}');
    }

    // 401 Unauthorized
    if (err.response?.statusCode == 401) {
      // Invalid access token
      if (err.response?.data['ResponseCode'] == '001') {
        log('${err.response?.data['Description']}');
      }

      // Access token expire
      if (err.response?.data['ResponseCode'] == '002') {
        //[TODO]: Refresh token
      }

      // Invalid username and password
      if (err.response?.data['ResponseCode'] == '003') {}

      // Password expire
      if (err.response?.data['ResponseCode'] == '004') {}
    }

    // 400 Bad Request
    if (err.response?.statusCode == 400) {
      log('${err.response?.data['Description']}');
    }

    // 500 Internal Server Error || 502 Bad Gateway || 404 Not Found
    if (err.response?.statusCode == 502 ||
        err.response?.statusCode == 404 ||
        err.response?.statusCode == 500) {
      log('Server Error');
    }

    return handler.reject(err);
  }

  @override
  void onResponse(response, handler) {
    if (response.data['ResponseCode'] == '000' &&
        response.data['Messages'] != null &&
        (response.data['Messages'][0]['MessageType'] == 'Popup' ||
            response.data['Messages'][0]['Type'] == 'Popup')) {
      log('${response.data['Messages'][0]['Description']}');
    }
    return handler.next(response);
  }
}
