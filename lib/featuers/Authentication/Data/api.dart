import 'dart:convert';
import 'package:dio/dio.dart';

class ApiManagerAuthentication {
  final Dio dio;

  ApiManagerAuthentication(this.dio);

  Future<void> registerUser(String userName, String email, String phoneNumber, String invitationBy) async {
    var headers = {
      'language': 'ar',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "invitationBy": invitationBy
    });

    try {
      var response = await dio.request(
        'https://maro-cares-z86j.onrender.com/auth/register',
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
      print('Failed to register user: $e');
    }
  }



}
