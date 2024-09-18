import 'dart:convert'; // For jsonEncode and jsonDecode
import 'package:bloc/bloc.dart';
import 'package:maro/featuers/Cart/Data/cart_api_manger.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Cart/bloc/cart_state.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiManagerApplyCoupon _apiManager;
  late SharedPreferences _prefs;

  CartBloc(this._apiManager)
      : super(CartState(cartItems: [], productCounts: {})) {
    _initializePreferences();

    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<IncrementProductQuantity>(_onIncrementProductQuantity);
    on<DecrementProductQuantity>(_onDecrementProductQuantity);
    on<ApplyCoupon>(_onApplyCoupon);
  }

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadCartData();
  }

  void _loadCartData() {
    final cartItemsJson = _prefs.getString('cartItems') ?? '[]';
    final productCountsJson = _prefs.getString('productCounts') ?? '{}';

    final List<dynamic> cartItemsList = jsonDecode(cartItemsJson);
    final Map<String, dynamic> productCountsMap = jsonDecode(productCountsJson);

    final cartItems =
        cartItemsList.map((item) => Product.fromJson(item)).toList();
    final productCounts = Map<String, int>.from(productCountsMap);

    emit(state.copyWith(cartItems: cartItems, productCounts: productCounts));
  }

  Future<void> _saveCartData(
      List<Product> cartItems, Map<String, int> productCounts) async {
    final cartItemsJson =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    final productCountsJson = jsonEncode(productCounts);

    await _prefs.setString('cartItems', cartItemsJson);
    await _prefs.setString('productCounts', productCountsJson);
  }

  void _onAddProductToCart(
      AddProductToCart event, Emitter<CartState> emit) async {
    final updatedCartItems = List<Product>.from(state.cartItems);
    final updatedProductCounts = Map<String, int>.from(state.productCounts);

    final productId = event.product.sId ?? '';
    if (updatedProductCounts.containsKey(productId)) {
      updatedProductCounts[productId] = updatedProductCounts[productId]! + 1;
    } else {
      updatedCartItems.add(event.product);
      updatedProductCounts[productId] = 1;
    }

    emit(state.copyWith(
        cartItems: updatedCartItems, productCounts: updatedProductCounts));
    await _saveCartData(updatedCartItems, updatedProductCounts);
  }

  void _onRemoveProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) async {
    final updatedCartItems = List<Product>.from(state.cartItems);
    final updatedProductCounts = Map<String, int>.from(state.productCounts);

    final productId = event.product.sId ?? '';
    updatedCartItems.removeWhere((product) => product.sId == productId);
    updatedProductCounts.remove(productId);

    emit(state.copyWith(
        cartItems: updatedCartItems, productCounts: updatedProductCounts));
    await _saveCartData(updatedCartItems, updatedProductCounts);
  }

  void _onIncrementProductQuantity(
      IncrementProductQuantity event, Emitter<CartState> emit) async {
    final updatedProductCounts = Map<String, int>.from(state.productCounts);
    final productId = event.product.sId ?? '';
    updatedProductCounts[productId] = updatedProductCounts[productId]! + 1;

    emit(state.copyWith(productCounts: updatedProductCounts));
    await _saveCartData(state.cartItems, updatedProductCounts);
  }

  void _onDecrementProductQuantity(
      DecrementProductQuantity event, Emitter<CartState> emit) async {
    final updatedProductCounts = Map<String, int>.from(state.productCounts);
    final productId = event.product.sId ?? '';

    if (updatedProductCounts[productId] == 1) {
      final updatedCartItems = List<Product>.from(state.cartItems);
      updatedCartItems.removeWhere((product) => product.sId == productId);
      updatedProductCounts.remove(productId);

      emit(state.copyWith(
          cartItems: updatedCartItems, productCounts: updatedProductCounts));
    } else {
      updatedProductCounts[productId] = updatedProductCounts[productId]! - 1;
      emit(state.copyWith(productCounts: updatedProductCounts));
    }
    await _saveCartData(state.cartItems, updatedProductCounts);
  }

  Future<void> _onApplyCoupon(
      ApplyCoupon event, Emitter<CartState> emit) async {
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
