import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timesheet/repositories/services/i_authen_service_repository.dart';
import 'package:timesheet/utils/const.dart';

class AuthenService implements IAuthenServiceRepository {
  @override
  Future<Map<String, dynamic>> authen(String userName, String password) async {
    final response = await http
        .post(
          //Use 10.0.2.2 as localhost for test.
          Uri.parse(kBaseURL),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "UserName": userName,
            "Password": password,
          }),
        )
        .timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Connected Failed!');
    }
  }
}
