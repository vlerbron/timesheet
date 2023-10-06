import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timesheet/utils/const.dart';

class AuthenService {
  final String userName;
  final String password;

  AuthenService({required this.userName, required this.password});

  Future<Map<String, dynamic>> authen() async {
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
