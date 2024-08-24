import 'package:equatable/equatable.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class CartState extends Equatable {
  final List<Product> cartItems;
  final Map<String, int> productCounts;
  final double discount;
  final String couponMessage;

  CartState({
    required this.cartItems,
    required this.productCounts,
    this.discount = 0.0,
    this.couponMessage = '',
  });

  @override
  List<Object> get props => [cartItems, productCounts, discount, couponMessage];

  CartState copyWith({
    List<Product>? cartItems,
    Map<String, int>? productCounts,
    double? discount,
    String? couponMessage,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      productCounts: productCounts ?? this.productCounts,
      discount: discount ?? this.discount,
      couponMessage: couponMessage ?? this.couponMessage,
    );
  }
}
