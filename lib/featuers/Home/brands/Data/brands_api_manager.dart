import 'package:dio/dio.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class ApiManagerBrands {
  final Dio dio = Dio();

  ApiManagerBrands();
 final LanguageManagerAPi languageManager = LanguageManagerAPi();
  
  
  Future<List<Product>> getProductByBrand(String brandName, int page) async {
    var headers = {'language': languageManager.currentLanguage};

    try {
      var response = await dio.get(
        'https://maro-cares-z86j.onrender.com/product/getProductByBrand/$brandName/$page',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        List<dynamic> productListJson = response.data['products'];
        List<Product> products = productListJson.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
