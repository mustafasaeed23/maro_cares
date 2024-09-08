import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/appbar_screens.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Cart/bloc/cart_state.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';
import 'package:maro/featuers/orders/presentation/screens/all_order_screen.dart'; // Import your AllOrdersScreen

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _couponController = TextEditingController();

  void _applyCoupon() {
    final couponCode = _couponController.text.trim();
    if (couponCode.isNotEmpty) {
      context.read<CartBloc>().add(ApplyCoupon(couponCode));
    }
  }

  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  // void _confirmOrder() async {
  //   final cartItems = context.read<CartBloc>().state.cartItems;

  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => AllOrdersScreen(orderItems: cartItems),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreens(context, "Shopping Cart"),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          double totalPrice = 0.0;
          state.cartItems.forEach((product) {
            final productId = product?.sId ?? '';
            final count = state.productCounts[productId] ?? 1;
            totalPrice += (product!.price ?? 0) * count;
          });

          final discountedPrice = totalPrice - state.discount;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.cartItems.isEmpty)
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1,
                    child: Center(
                      child: Text(
                        "Your cart is empty.".tr(),
                        style: getBoldBlack12Style().copyWith(
                            color: MyTheme.mainPrimaryColor4, fontSize: 18.sp),
                      ),
                    ),
                  )
                else ...[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems[index];
                      final productId = product.sId ?? '';
                      final count = state.productCounts[productId] ?? 1;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductsDetailsScreen(
                                product: product,
                                languageManager: languageManager,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 18),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    product.images != null &&
                                            product.images!.isNotEmpty
                                        ? product.images![0]
                                        : 'https://via.placeholder.com/150',
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.h),
                                    Row(
                                      children: [
                                        Text(
                                          "SAR".tr(),
                                          style: getBoldBlack14Style().copyWith(
                                            color: const Color.fromARGB(
                                                255, 7, 99, 10),
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                            '${product.price?.toStringAsFixed(2)}',
                                            style:
                                                getBoldBlack14Style().copyWith(
                                              color: const Color.fromARGB(
                                                  255, 7, 99, 10),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: const Color(0xffe6d9e8),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(5),
                                    onPressed: () {
                                      if (count > 1) {
                                        context.read<CartBloc>().add(
                                            DecrementProductQuantity(product));
                                      } else {
                                        return;
                                      }
                                    },
                                    icon: const Icon(Icons.remove),
                                    color: Colors.deepPurple,
                                    iconSize: 30.0,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "$count",
                                  style: getBoldBlack14Style(),
                                ),
                                SizedBox(width: 8.w),
                                CircleAvatar(
                                  backgroundColor: const Color(0xffe6d9e8),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(5),
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          IncrementProductQuantity(product));
                                    },
                                    icon: const Icon(Icons.add),
                                    color: Colors.deepPurple,
                                    iconSize: 30.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveProductFromCart(product));
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 178, 20, 9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 280.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "Have a coupon?".tr(),
                      style: getBoldBlack14Style(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: MyTheme.ColorContainer,
                            width: 280.w,
                            child: TextField(
                              controller: _couponController,
                              decoration: InputDecoration(
                                fillColor: const Color(0xffe6d9e8),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                label: Text("Coupon".tr()),
                                labelStyle: getBoldBlack14Style(),
                                suffixIcon: const Icon(Icons.discount),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: MyTheme.ColorContainer,
                          child: IconButton(
                            onPressed: _applyCoupon,
                            icon: const Icon(
                              Icons.check,
                              size: 35,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.couponApplied) ...[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            "Discount".tr(),
                            style: getBoldBlack14Style().copyWith(
                                color: const Color.fromARGB(255, 179, 1, 1)),
                          ),
                          const Spacer(),
                          Text(
                            "- SAR ${state.discount.toStringAsFixed(2)}",
                            style: getBoldBlack14Style().copyWith(
                                color: const Color.fromARGB(255, 179, 1, 1)),
                          ),
                        ],
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          "Total".tr(),
                          style: getBoldBlack14Style().copyWith(
                              color: const Color.fromARGB(255, 75, 52, 106)),
                        ),
                        const Spacer(),
                        Text(
                          "SAR ${discountedPrice.toStringAsFixed(2)}",
                          style: getBoldBlack14Style().copyWith(
                              color: const Color.fromARGB(255, 75, 52, 106)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(createOrder);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.mainPrimaryColor4,
                        minimumSize: Size(double.infinity, 50.h),
                      ),
                      child: Text(
                        "Confirm Payment".tr(),
                        style: getBoldWhite14Style(),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
