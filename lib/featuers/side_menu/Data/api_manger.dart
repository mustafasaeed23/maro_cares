import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

// ApiManager class
class ApiManager {
  final Dio _dio = Dio();

  Future<List<dynamic>> getProductsByCategory(String category, int page, String language) async {
    var headers = {'language': language};
    var url = 'https://maro-cares-z86j.onrender.com/product/getProductByCategory/$category/$page';

    try {
      var response = await _dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data != null && response.data['products'] != null) {
          return response.data['products'];
        } else {
          throw Exception('No products found in the response');
        }
      } else {
        throw Exception('Error: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.statusMessage}');
      } else {
        throw Exception('Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
