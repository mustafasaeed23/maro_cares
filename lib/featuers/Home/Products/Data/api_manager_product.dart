import 'package:dio/dio.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class ApiManagerProducts{
  static String _language = 'ar'; 

  void setLanguage(String language) {
    _language = language;
  }
  String getLanguage() {
    return _language;
  }

  Future<List<Product>> getTrendingProducts() async {
  var dio = Dio();
  var headers = {
      'language': _language,
     };
  try {
    var response = await dio.get(
      'https://maro-cares-z86j.onrender.com/product/getProductBySectionType/Trending',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      var data = ProductsResponse.fromJson(response.data);
      return data.productsList ?? [];
    } else {
      throw Exception('Failed to load products: ${response.statusMessage}');
    }
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

 Future<List<Product>> getOnSaleProducts() async {
  var dio = Dio();
  var headers = {'language': 'ar'};

  try {
    var response = await dio.get(
      'https://maro-cares-z86j.onrender.com/product/getProductBySectionType/On Sale',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      var data = ProductsResponse.fromJson(response.data);
      return data.productsList ?? [];
    } else {
      throw Exception('Failed to load products: ${response.statusMessage}');
    }
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

Future<List<Product>> getOurSelectionProducts() async {
  var dio = Dio();
  var headers = {'language': 'ar'};

  try {
    var response = await dio.get(
      'https://maro-cares-z86j.onrender.com/product/getProductBySectionType/Our Selection',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      var data = ProductsResponse.fromJson(response.data);
      return data.productsList ?? [];
    } else {
      throw Exception('Failed to load products: ${response.statusMessage}');
    }
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

}