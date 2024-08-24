import 'package:dio/dio.dart';
import 'dart:convert';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://maro-cares-z86j.onrender.com/auth';

  Future<void> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String invitationBy,
  }) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "userName": userName,
      "email": userName,
      "phoneNumber": phoneNumber,
      "invitationBy": phoneNumber
    });

    try {
      var response = await _dio.request(
        '$_baseUrl/register',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> loginUser({
    required String phoneNumber,
  }) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "phoneNumber": phoneNumber,
    });

    try {
      var response = await _dio.post(
        '$_baseUrl/login',
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> verifyAccount({
    required String phoneNumber,
    required String code,
  }) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "phoneNumber": phoneNumber,
      "code": code
    });

    try {
      var response = await _dio.request(
        'https://maro-cares-z86j.onrender.com/user/verificationAccount',
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<void> resendVerificationCode({
    required String phoneNumber,
  }) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "phoneNumber": phoneNumber,
    });

    try {
      final response = await _dio.post(
        '$_baseUrl/user/resendVerificationCode/verify',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print('Verification code resent: ${json.encode(response.data)}');
      } else {
        print('Failed to resend verification code: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error resending verification code: $e');
    }
  }
}
