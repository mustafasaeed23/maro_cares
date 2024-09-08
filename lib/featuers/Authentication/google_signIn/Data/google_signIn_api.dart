import 'package:dio/dio.dart';

class SignInGoogleApi {
  final Dio _dio = Dio();
  
  Future<Map<String, dynamic>> authenticateGoogle(String accessToken) async {
    try {
      var response = await _dio.post(
        'https://maro-cares-z86j.onrender.com/auth/google',
        data: {'access_token': accessToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // Return the response data as a Map
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      throw Exception('Backend authentication error: $e');
    }
  }
}
