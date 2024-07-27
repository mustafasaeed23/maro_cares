import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/color_manager.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/heart_Icon.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Cart/screen/cart_screen.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.imageUrl, required this.product});

  final String imageUrl;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: HeartIcon(
              product: product,
            ),
          ),
          // SizedBox(height: 10.h),
          Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
            height: 300.h,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.productName ?? 'No name',
                  style: getMediumBlue14Style(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text("SAR".tr(),
                        style: getBoldBlack14Style().copyWith(
                          color: const Color.fromARGB(255, 7, 99, 10),
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      product.price != null
                          ? "${product.price} "
                          : 'No price'.tr(),
                      style: getBoldBlack14Style().copyWith(
                        color: const Color.fromARGB(255, 7, 99, 10),
                      ),
                    ),
                    Spacer(),
                    RatingBarIndicator(
                      rating: product.totalRating?.toDouble() ?? 0.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      product.category ?? 'No category',
                      style: getMediumBlack12Style().copyWith(
                        color: MyTheme.mainPrimaryColor4,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      product.brand ?? "",
                      style: getMediumBlack14Style(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(AddProductToCart(product));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(product.category ?? "",
                                    style: getMediumWhite12Style()),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "added to cart, press to show".tr(),
                                  style: getMediumWhite12Style(),
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: ColorManager.greenColor),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Add to Cart".tr(),
                        style: getMediumWhite14Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
