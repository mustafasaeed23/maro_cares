import 'package:dio/dio.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class ApiManagerBrands {
  final Dio dio = Dio();
  
  Future<List<Product>> getProductByBrand(String brandName, int page, String lang) async {
    var headers = {
      'language': lang
    };
    var response = await dio.request(
      'https://maro-cares-z86j.onrender.com/product/getProductByBrand/$brandName/$page',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> productListJson = response.data['products'];
      List<Product> products = productListJson.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
