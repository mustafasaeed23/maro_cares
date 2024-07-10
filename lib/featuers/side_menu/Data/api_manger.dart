import 'package:dio/dio.dart';
import 'dart:convert';

class ApiManager {
  final Dio _dio = Dio();

  Future<void> fetchData(String category, int page, String language) async {
    var headers = {
      'language': language
    };
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
        print(json.encode(response.data));
      } else {
        print('Error: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // The server responded with a non-200 status code
        print('Error: ${e.response?.statusMessage}');
      } else {
        // Something happened in setting up or sending the request that triggered an error
        print('Error: ${e.message}');
      }
    } catch (e) {
      // Handle any other errors
      print('Unexpected error: $e');
    }
  }
}
