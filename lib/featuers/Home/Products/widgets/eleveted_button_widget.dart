import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/color_manager.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class ElevetedButtonWidget extends StatelessWidget {
  const ElevetedButtonWidget({
    super.key,
    required this.widget,
  });

  final ProductsDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyTheme.mainPrimaryColor4,
      ),
      onPressed: () {
        context.read<CartBloc>().add(AddProductToCart(widget.product));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Row(
                children: [
                  Text(widget.product.category ?? "",
                      style: getMediumWhite14Style()),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "added to cart, press to show".tr(),
                    style: getMediumWhite14Style(),
                  ),
                ],
              ),
              backgroundColor: ColorManager.greenColor),
        );
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart,
              color: MyTheme.mainColor,
              size: 20,
            ),
            SizedBox(width: 10.w),
            Text(
              "Add to Cart".tr(),
              style: getMediumWhite14Style(),
            ),
          ],
        ),
      ),
    );
  }
}
