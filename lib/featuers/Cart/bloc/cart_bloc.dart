import 'package:bloc/bloc.dart';
import 'package:maro/featuers/Cart/Data/cart_api_manger.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Cart/bloc/cart_state.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiManagerApplyCoupon _apiManager;

  CartBloc(this._apiManager)
      : super(CartState(cartItems: [], productCounts: {})) {
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<IncrementProductQuantity>(_onIncrementProductQuantity);
    on<DecrementProductQuantity>(_onDecrementProductQuantity);
    on<ApplyCoupon>(_onApplyCoupon);
  }

  void _onAddProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    final updatedCartItems = List<Product>.from(state.cartItems);
    final updatedProductCounts = Map<String, int>.from(state.productCounts);

    final productId = event.product.sId ?? '';
    if (updatedProductCounts.containsKey(productId)) {
      updatedProductCounts[productId] = updatedProductCounts[productId]! + 1;
    } else {
      updatedCartItems.add(event.product);
      updatedProductCounts[productId] = 1;
    }

    emit(state.copyWith(cartItems: updatedCartItems, productCounts: updatedProductCounts));
  }

  void _onRemoveProductFromCart(RemoveProductFromCart event, Emitter<CartState> emit) {
    final updatedCartItems = List<Product>.from(state.cartItems);
    final updatedProductCounts = Map<String, int>.from(state.productCounts);

    final productId = event.product.sId ?? '';
    updatedCartItems.removeWhere((product) => product.sId == productId);
    updatedProductCounts.remove(productId);

    emit(state.copyWith(cartItems: updatedCartItems, productCounts: updatedProductCounts));
  }

  void _onIncrementProductQuantity(IncrementProductQuantity event, Emitter<CartState> emit) {
    final updatedProductCounts = Map<String, int>.from(state.productCounts);
    final productId = event.product.sId ?? '';
    updatedProductCounts[productId] = updatedProductCounts[productId]! + 1;

    emit(state.copyWith(productCounts: updatedProductCounts));
  }

  void _onDecrementProductQuantity(DecrementProductQuantity event, Emitter<CartState> emit) {
    final updatedProductCounts = Map<String, int>.from(state.productCounts);
    final productId = event.product.sId ?? '';

    if (updatedProductCounts[productId] == 1) {
      final updatedCartItems = List<Product>.from(state.cartItems);
      updatedCartItems.removeWhere((product) => product.sId == productId);
      updatedProductCounts.remove(productId);

      emit(state.copyWith(cartItems: updatedCartItems, productCounts: updatedProductCounts));
    } else {
      updatedProductCounts[productId] = updatedProductCounts[productId]! - 1;
      emit(state.copyWith(productCounts: updatedProductCounts));
    }
  }

  Future<void> _onApplyCoupon(ApplyCoupon event, Emitter<CartState> emit) async {
    try {
      final response = await _apiManager.applyCoupon(event.couponCode);
      if (response['success'] == true) {
        final discount = (response['discount'] ?? 0.0) as double;
        emit(state.copyWith(
          discount: discount,
          couponMessage: 'Coupon applied successfully!',
          couponApplied: true,
        ));
      } else {
        emit(state.copyWith(
          couponMessage: response['message'] ?? 'Failed to apply coupon.',
          couponApplied: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        couponMessage: 'Error applying coupon: $e',
        couponApplied: false,
      ));
    }
  }
}
