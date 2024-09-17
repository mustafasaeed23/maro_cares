import 'package:dio/dio.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class ApiManagerProducts {
  final Dio dio;
  ApiManagerProducts() : dio = Dio();

  Future<List<Product>> _fetchProducts(String sectionType) async {
    String lang = LanguageManagerAPi().currentLanguage;

    var headers = {'language': lang};

    try {
      var response = await dio.get(
        'https://maro-cares-z86j.onrender.com/product/getProductBySectionType/$sectionType',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        var data = ProductsResponse.fromJson(response.data);
        return data.productsList ?? [];
      } else {
        throw Exception(
            'Failed to load $sectionType products: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to load $sectionType products: $e');
    }
  }

  Future<List<Product>> getTrendingProducts() async {
    return _fetchProducts('Trending');
  }

  Future<List<Product>> getOnSaleProducts() async {
    return _fetchProducts('On Sale');
  }

  Future<List<Product>> getOurSelectionProducts() async {
    return _fetchProducts('Our Selection');
  }
}
