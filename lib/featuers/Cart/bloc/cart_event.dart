import 'package:equatable/equatable.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;

  const AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final Product product;

  const RemoveProductFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class IncrementProductQuantity extends CartEvent {
  final Product product;

  const IncrementProductQuantity(this.product);

  @override
  List<Object> get props => [product];
}

class DecrementProductQuantity extends CartEvent {
  final Product product;

  const DecrementProductQuantity(this.product);

  @override
  List<Object> get props => [product];
}

class ApplyCoupon extends CartEvent {
  final String couponCode;

  const ApplyCoupon(this.couponCode);

  @override
  List<Object> get props => [couponCode];
}