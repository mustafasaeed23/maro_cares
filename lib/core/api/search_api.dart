import 'package:dio/dio.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class ApiSearch {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://maro-cares-z86j.onrender.com';

  Future<List<Product>> searchProducts(String searchTerm) async {
    var headers = {
      'language': 'ar',
    };

    try {
      String encodedSearchTerm = Uri.encodeComponent(searchTerm);
      var response = await _dio.get(
        '$_baseUrl/product/searchForProduct/$encodedSearchTerm',
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        var productsResponse = ProductsResponse.fromJson(response.data);
        return productsResponse.productsList ?? [];
      } else {
        print('Error: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      print('Exception caught: $e');
      return [];
    }
  }
}
