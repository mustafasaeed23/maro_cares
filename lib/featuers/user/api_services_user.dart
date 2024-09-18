import 'package:dio/dio.dart';
import 'dart:convert';

class APIServiceUser {
  final Dio dio = Dio();
  final String baseUrl;

  APIServiceUser({required this.baseUrl});

  Future<void> submitRating(String userId, int numberOfStars) async {
    var headers = {
      'authorization':
          'maroTKeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OTVkYzVmNTc1NTNiYmIzYjlkZThjMSIsImlhdCI6MTcwNDMyMDM5M30.fxRqhJmdg_VROgTyykN2amRNRDd_z3PQnfM7FzZGLbs',
      'language': 'en',
      'Content-Type': 'application/json'
    };
    var data = json.encode({"numberOfStar": numberOfStars});

    var response = await dio.request(
      '$baseUrl/user/addRating/$userId',
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
      throw Exception('Failed to submit rating');
    }
  }
}
