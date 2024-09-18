import 'package:dio/dio.dart';
import 'package:maro/featuers/orders/data/user_model.dart';

class UserOrderService {
  final Dio dio;
  final String baseUrl;

  UserOrderService({
    required this.dio,
    required this.baseUrl,
  });

  Future<Response> createOrder({
    required String userId,
    required String authToken,
    required UserOrder order,
    required String language,
  }) async {
    final String url = '$baseUrl/user/createOrder/$userId';
    final Map<String, String> headers = {
      'Authorization': authToken,
      'Content-Type': 'application/json',
      'language': language,
    };

    return await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: order.toJson(),
    );
  }
}
