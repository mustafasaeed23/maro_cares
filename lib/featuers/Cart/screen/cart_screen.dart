// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/appbar_screens.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Cart/bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreens(context, "Shopping Cart"),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          double totalPrice = 0.0;
          state.cartItems.forEach((product) {
            final productId = product.sId ?? '';
            final count = state.productCounts[productId] ?? 1;
            totalPrice += (product.price ?? 0) * count;
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems[index];
                      final productId = product.sId ?? '';
                      final count = state.productCounts[productId] ?? 1;

                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                        child: Padding(
                          padding: EdgeInsets.all(16),
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
                                          style: getBoldBlack14Style().copyWith(
                                            color: const Color.fromARGB(
                                                255, 7, 99, 10),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
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
                              SizedBox(width: 8),
                              Text(
                                "$count",
                                style: getBoldBlack14Style(),
                              ),
                              SizedBox(width: 8),
                              CircleAvatar(
                                backgroundColor: const Color(0xffe6d9e8),
                                child: IconButton(
                                  padding: const EdgeInsets.all(5),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(IncrementProductQuantity(product));
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
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 178, 20, 9),
                                ),
                              ),
                            ],
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
                                fillColor: Color(0xffe6d9e8),
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
                                suffixIcon: Icon(Icons.discount),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: MyTheme.ColorContainer,
                          child: IconButton(
                            onPressed: _applyCoupon,
                            icon: Icon(
                              Icons.check,
                              size: 35,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.couponMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.couponMessage!,
                        style: getBoldBlack14Style().copyWith(
                          color: state.couponMessage!.contains('Invalid')
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ ${discountedPrice.toStringAsFixed(2)}",
                          style: getBoldBlack14Style(),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          ": Total",
                          style: getBoldBlack14Style(),
                        ).tr(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.mainPrimaryColor4),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 25,
                              color: MyTheme.mainColor,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Confirm Payment".tr(),
                              style: getBoldWhite14Style(),
                            ),
                          ],
                        ),
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
