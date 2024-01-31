import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuncare/constants/api.dart';

class LoginResponse {
  final bool success;
  final String message;
  final String token;

  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
  });
}

class BasicResponse {
  final bool success;
  final String message;

  BasicResponse({
    required this.success,
    required this.message,
  });
}

class AuthService {
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'email': email.trim(),
          'password': password.trim(),
        },
      ),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return LoginResponse(
        success: responseData['success'],
        message: responseData['message'],
        token: responseData['token'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<BasicResponse> register(Map<String, String> userData) async {
    final url = Uri.parse("$baseUrl/auth/register");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return BasicResponse(
        success: responseData['success'],
        message: responseData['message'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }
}
