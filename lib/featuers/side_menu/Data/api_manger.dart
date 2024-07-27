import 'package:dio/dio.dart';
import '../../Home/Products/Data/model.dart';

class ApiManager {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://maro-cares-z86j.onrender.com';

  ApiManager() {
    // Initialize Dio settings here if needed
  }

  Future<List<Product>> fetchData(String category, int page, String language) async {
    var headers = {
      'language': language,
    };

    try {
      var response = await _dio.request(
        Uri.encodeFull('$_baseUrl/product/getProductByCategory/$category/$page'),
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        List<Product> products = (response.data['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
        return products;
      } else {
        print(response.statusMessage);
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
