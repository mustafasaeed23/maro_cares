import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://maro-cares-z86j.onrender.com/auth';

  // Authorization token
  final String _authToken =
      'maroTKeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OTVkYzVmNTc1NTNiYmIzYjlkZThjMSIsImlhdCI6MTcwNDMyMDM5M30.fxRqhJmdg_VROgTyykN2amRNRDd_z3PQnfM7FzZGLbs';

  Future<void> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String invitationBy,
  }) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json',
    };
    var data = json.encode({
      "userName": userName,
      "email": userName,
      "phoneNumber": phoneNumber,
      "invitationBy": invitationBy,
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
      'Content-Type': 'application/json',
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
      if (response.statusCode == 200) {
        print(response);
      }
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
      'Content-Type': 'application/json',
    };
    var data = json.encode({
      "phoneNumber": phoneNumber,
      "code": code,
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
      'Content-Type': 'application/json',
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

  // Add the verifyLoginCode method to the AuthService class
  Future<void> verifyLoginCode({
    required String phoneNumber,
    required String code,
  }) async {
    var headers = {
      'Authorization': _authToken, // Authorization header with token
      'language': 'ar',
      'Content-Type': 'application/json',
    };

    var data = json.encode({
      "phoneNumber": phoneNumber,
      "code": code,
    });

    try {
      var response = await _dio.post(
        'https://maro-cares-z86j.onrender.com/user/verificationLoginCode',
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        print('Login successful: ${json.encode(response.data)}');
      } else {
        print('Login failed: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error during login verification: $e');
      throw Exception('Login verification failed');
    }
  }
}
