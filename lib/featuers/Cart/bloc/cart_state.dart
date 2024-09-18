import 'package:equatable/equatable.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class CartState extends Equatable {
  final List<Product> cartItems;
  final Map<String, int> productCounts;
  final double discount;
  final String couponMessage;
  final bool couponApplied;

  CartState({
    required this.cartItems,
    required this.productCounts,
    this.discount = 0.0,
    this.couponMessage = '',
    this.couponApplied = false,
  });

  @override
  List<Object> get props =>
      [cartItems, productCounts, discount, couponMessage, couponApplied];

  CartState copyWith({
    List<Product>? cartItems,
    Map<String, int>? productCounts,
    double? discount,
    String? couponMessage,
    bool? couponApplied, // Add this parameter
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      productCounts: productCounts ?? this.productCounts,
      discount: discount ?? this.discount,
      couponMessage: couponMessage ?? this.couponMessage,
      couponApplied: couponApplied ?? this.couponApplied, // Update this field
    );
  }
}
