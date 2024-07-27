import 'dart:convert';
import 'package:dio/dio.dart';

class ApiManagerApplyCoupon {
  final Dio _dio;

  ApiManagerApplyCoupon(this._dio);

  Future<Map<String, dynamic>> applyCoupon(String couponCode) async {
    final headers = {
      'Authorization': 'maroTKeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OTVkYzVmNTc1NTNiYmIzYjlkZThjMSIsImlhdCI6MTcwNDMyMDM5M30.fxRqhJmdg_VROgTyykN2amRNRDd_z3PQnfM7FzZGLbs',
      'Language': 'en',
      'Content-Type': 'application/json',
    };

    final data = json.encode({
      "coupon": couponCode,
    });

    try {
      final response = await _dio.post(
        'https://maro-cares-z86j.onrender.com/coupon/applyCoupon',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to apply coupon: ${response.statusMessage}');
      }
    } catch (e) {
      // Handle the exception accordingly
      throw Exception('Exception occurred: $e');
    }
  }
}
